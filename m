Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF635A0CC8
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 11:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240266AbiHYJg1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 05:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiHYJg0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 05:36:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E091A9C1D
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 02:36:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2955961BF5
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 09:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799CDC433D7;
        Thu, 25 Aug 2022 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661420184;
        bh=2yuuGWBwwNfknkBefEm5GiNteL6hZMuWOqBJl2mwvQo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bGn35PdDyuTutNL4enJ3Ti2qePFDIMYC+gTDqF+Ks4td9FBx823hKj8Vs0rEWeu0J
         jkAlHY7M209CR0P9V7w1CaRJp4lM86I2f3ok+mmQdriVm/5J9+YCHYa+HFAzSgDVBZ
         L6KUolJ7NqhEcIndP5++VRVffdoTVCgeKbTy2RPqyH9G9ACFJfidoreFZd93KSd2Ie
         3i8EO+bucN0lphG0YSDKjJBoq630MeQZik3ZQYTAWkSsfTc8W5+0yzYeuThZqXILQ5
         SOp7i1aVQZy6sCP5WxzPxru9lP2TFb7j6zkV07kMTBXqtpY++75f4f5ALHs0i7IDO5
         ywmBTfadwWHpA==
Date:   Thu, 25 Aug 2022 11:36:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] hid: intel-ish-hid: ishtp: Fix ishtp client sending
 disordered message
In-Reply-To: <1659574759-30159-1-git-send-email-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.2208251135480.19850@cbobk.fhfr.pm>
References: <1659574759-30159-1-git-send-email-even.xu@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Aug 2022, Even Xu wrote:

> There is a timing issue captured during ishtp client sending stress tests.
> It was observed during stress tests that ISH firmware is getting out of
> ordered messages. This is a rare scenario as the current set of ISH client
> drivers don't send much data to firmware. But this may not be the case
> going forward.
> 
> When message size is bigger than IPC MTU, ishtp splits the message into
> fragments and uses serialized async method to send message fragments.
> The call stack:
> ishtp_cl_send_msg_ipc->ipc_tx_callback(first fregment)->
> ishtp_send_msg(with callback)->write_ipc_to_queue->
> write_ipc_from_queue->callback->ipc_tx_callback(next fregment)......
> 
> When an ipc write complete interrupt is received, driver also calls
> write_ipc_from_queue->ipc_tx_callback in ISR to start sending of next fragment.
> 
> Through ipc_tx_callback uses spin_lock to protect message splitting, as the
> serialized sending method will call back to ipc_tx_callback again, so it doesn't
> put sending under spin_lock, it causes driver cannot guarantee all fragments
> be sent in order.
> 
> Considering this scenario:
> ipc_tx_callback just finished a fragment splitting, and not call ishtp_send_msg
> yet, there is a write complete interrupt happens, then ISR->write_ipc_from_queue
> ->ipc_tx_callback->ishtp_send_msg->write_ipc_to_queue......
> 
> Because ISR has higher exec priority than normal thread, this causes the new
> fragment be sent out before previous fragment. This disordered message causes
> invalid message to firmware.

I can imagine that this must have been nightmare to debug :)

> The solution is, to send fragments synchronously: Use 
> ishtp_write_message writing fragments into tx queue directly one by one, 
> instead of ishtp_send_msg only writing one fragment with completion 
> callback. As no completion callback be used, so change ipc_tx_callback 
> to ipc_tx_send.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

