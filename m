Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A9157C9E3
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 13:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbiGULo7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 07:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiGULo6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 07:44:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8640782FB6
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 04:44:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F00761C19
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 11:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE75C3411E;
        Thu, 21 Jul 2022 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658403896;
        bh=vTmJNKzjgYgbuMDrg3L9eoi1hiju/a0KulrK6MZ0J5Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gXqM0vZsbqHUQuE3hIQ9Gn1EGv8vYYljEXejLgq07IMI25z9S4A4dg0Q66ho+Wf32
         z4az6M8QFxcG1DVQDrdZacxlv1Bc6GjXfHoyoSs35THZsp3gaIUQIE+smt5nyt8n7o
         rpB4u9kWxSnNC5ly7C5R+5h9MwmT9ZfopNNLC0n8o9Yns7Kf4qumyRUqzxJOBuTwyP
         whxauApFk/L6Q1XgHDS8K8ysR/Cn8HaqlxTncnOoCYWoRVwyamqZ/S563ZSKkEco1n
         T4LfRv/WoYO3pDu1JWTjmmcN/pTNSywcpDSICoESOUwmIh1IPCdOATD/Ycpg5zLrRw
         xjts4g8zMj+Jw==
Date:   Thu, 21 Jul 2022 13:44:53 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1
 functionality
In-Reply-To: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2207211344360.19850@cbobk.fhfr.pm>
References: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 12 Jul 2022, Basavaraj Natikar wrote:

> Changes includes fixes and support of new firmware (SFH 1.1) with new
> PCI device ID to implement SFH1.1 functionality which is used by
> newer AMD SOCs.

Queued in hid.git#for-5.20/amd-sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs

