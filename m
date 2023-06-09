Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E6E729F4B
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 17:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbjFIPzH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 11:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239309AbjFIPzG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 11:55:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736D83588
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 08:55:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05F8865979
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 15:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FF6C433EF;
        Fri,  9 Jun 2023 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686326103;
        bh=u/lfDApzBoUX1EK/P4iopS4VhCwkzzOJektckp3rlNw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PPdYq9Fb0BhRvAMyuaAKwJtI9jLVuXEazunsvFNY9Llb+ZAmzPNIBuEXPmhPCYzBX
         YStyTw1MxQBn0I4EiCmX0IkzMmmpvJ8V6xarr5TzBw81SrbjV7m60LHGqc3hB0Di/n
         KXgrvwzPQThvFVWH7KoPqvuUnVwYF87CD1M/vp0vH7IQckrhN7bfHzFGh8Ccyzaogr
         FZbOv4w+7piG+jYh+/zohGxwdOZBkaeUGmJM3ZukEU/UK5vpl6SPAig+xSm8qKnhFw
         wUWKR9L8fE3z2X/nBgXCH8BD4ERM8l1nrbg/N2VDkepH8GdW44ZGuIYPWG0PgGkLcO
         sV5wtzXzBOUNQ==
Date:   Fri, 9 Jun 2023 17:55:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marco Morandini <marco.morandini@polimi.it>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: HP: add support for 03f0:464a HP Elite Presenter
 Mouse
In-Reply-To: <eaa51a28-fe4a-a41f-040d-93e7a32d0a1f@polimi.it>
Message-ID: <nycvar.YFH.7.76.2306091754520.5716@cbobk.fhfr.pm>
References: <eaa51a28-fe4a-a41f-040d-93e7a32d0a1f@polimi.it>
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

On Tue, 30 May 2023, Marco Morandini wrote:

> HP Elite Presenter Mouse HID Record Descriptor shows
> two mouses (Repord ID 0x1 and 0x2), one keypad (Report ID 0x5),
> two Consumer Controls (Report IDs 0x6 and 0x3).
> Previous to this commit it registers one mouse, one keypad
> and one Consumer Control, and it was usable only as a
> digitl laser pointer (one of the two mouses). This patch defines
> the 464a USB device ID and enables the HID_QUIRK_MULTI_INPUT
> quirk for it, allowing to use the device both as a mouse
> and a digital laser pointer.
> 
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

