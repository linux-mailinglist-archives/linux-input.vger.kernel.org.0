Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E63509995
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 09:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344469AbiDUHsw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 03:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386312AbiDUHsE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 03:48:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578491FA4A
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 00:43:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08BB7B81136
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 07:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B5EC385A5;
        Thu, 21 Apr 2022 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650527013;
        bh=oyg5PTRU7o9fvY3M7/hL5zupak9G7sYgxUZcQec9ylI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JdCI2/8xJ1CN+SXLXeimTsyKyqu3hg86it8zaSEgk9lWtra7B7EYtxtDFCzthFzd3
         Eyj/0SEbaLBhpqFBL4FtAvZWFr5CNw54b9TIF9B6YIlQjE25wThndtAjA6LhwvxI6c
         KYvBb+zLQNeeXxZgvRm83PEhA3PmPEsBXWMPyYMOM5JDdo7Se6G2FoaiwSyG2iaX7x
         B4OeGSWjUrHbCO6ZzKJQFMjfscDaxTE7MDoECpvuLGkx3i3AOWYy1XEQEeWSnyBAOY
         /LWX2Tu32wKKUZOud4acO3TqnGReAP0sfiQ+ZR/Q4FqA0A2HTAPetdS5hvYePJc7UH
         Nq2vysnrPakhg==
Date:   Thu, 21 Apr 2022 09:43:29 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Joshua Dickens <joshua@joshua-dickens.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: wacom: Adding Support for new usages
In-Reply-To: <20220322213316.101787-1-Joshua@Joshua-Dickens.com>
Message-ID: <nycvar.YFH.7.76.2204210943161.30217@cbobk.fhfr.pm>
References: <20220322213316.101787-1-Joshua@Joshua-Dickens.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Mar 2022, Joshua Dickens wrote:

> From: Joshua-Dickens <Joshua@Joshua-Dickens.com>
> 
> Added supprt for the following usages:
> * HID_DG_SCANTIME to report the timestamp for pen and touch events.
> * WACOM_HID_WD_BARRELSWITCH3 to support pens with 3 buttons.
> * WACOM_HID_WD_SEQUENCENUMBER to detect and report dropped packets.
> 
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Now queued in hid.git#for-5.19/wacom. Thanks,

-- 
Jiri Kosina
SUSE Labs

