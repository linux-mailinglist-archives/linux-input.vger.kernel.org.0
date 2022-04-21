Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90D0E509AAC
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 10:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386656AbiDUIdR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 04:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386671AbiDUIce (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 04:32:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E599313EB0
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 01:29:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8150161BD9
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 08:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB90DC385A5;
        Thu, 21 Apr 2022 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650529784;
        bh=ojWLh9hFA32bUeeselQibCDYxTajyZpm9Jz4FFsMt5Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QMOItneeQn6cJZUhNeUp2Vwk+EGthRbsoVrQSrvlcwwwAiSz6weRWKH5sNJxBu1VU
         C/8jLXUOu5FNKmrceLttK67nq8ZJN+jTyDny3m1tcT+KYu0IbQhbSOtGVGVHqMPrUI
         4xjmpyZMzYCX/bDFmAUf5LpWoS/jIgTBhcIZ5A1oHlunmt0VKTYx2gNVbsackmOuL0
         dZYY7s2bkkAH1RmlgnuZhKelVa6QVEOjLnxBJn315MkXlbr2RmovQB2SzHj5UVQ+w+
         YuhijM6KspPRUvlxCtH2x+Awzxf0uEg8Q67EnW+7m3D0GSko/jxD6bCVixFZaLZRMV
         hv4N6f0oP3E2A==
Date:   Thu, 21 Apr 2022 10:29:41 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jonathan Teh <jonathan.teh@outlook.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] HID: hid-led: fix maximum brightness for Dream Cheeky
In-Reply-To: <DBAPR04MB7366AA271FE1A1022D96C0BD920E9@DBAPR04MB7366.eurprd04.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2204211029350.30217@cbobk.fhfr.pm>
References: <DBAPR04MB7366AA271FE1A1022D96C0BD920E9@DBAPR04MB7366.eurprd04.prod.outlook.com>
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

On Sun, 13 Mar 2022, Jonathan Teh wrote:

> Increase maximum brightness for Dream Cheeky to 63. Emperically
> determined based on testing in kernel 4.4 on this device:
> 
> Bus 003 Device 002: ID 1d34:0004 Dream Cheeky Webmail Notifier
> 
> Fixes: 6c7ad07e9e05 ("HID: migrate USB LED driver from usb misc to hid")
> Signed-off-by: Jonathan Teh <jonathan.teh@outlook.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

