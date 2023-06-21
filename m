Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AC073932D
	for <lists+linux-input@lfdr.de>; Thu, 22 Jun 2023 01:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjFUXl5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jun 2023 19:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjFUXl4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jun 2023 19:41:56 -0400
Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9999F1721;
        Wed, 21 Jun 2023 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uu+2SHhBiQ1uimHyfpXUI941L2mRtfYPG3HcNeup1dM=; t=1687390913; x=1688254913; 
        b=m4nRbWh6ME77w1Ore2zaHICL5mByHD7cyh42EXpadS/HGKZs/cdHR4W9gs5T29qIe1IFqV1MGRc
        buiZsGy+55PIEqM3cx8hWy2IgQReRvDqrHXQ1jj0q66AsqqFUm+zwJM0TuXHSmng07w01pDg15pUU
        0abEZ/NOCvcFXZTPAn83UrR48dfiQ73zzm7aaGqc2mkZS1q6sG8igj5qGcnxtPPrZ1UbdjeKMO2Mu
        mxBXJWoCtHVaP/LoldVWOZZuPK8TF+uzTr2CzqthDFX4vTHGguoZEbb7GT/kS1S00Ps74NRkEHwsm
        uFaJHA+sDXNiqgJdHMER5cdcirf2N2GC2rxQ==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
        by mail.blnma.de with esmtp (Exim 4.96)
        (envelope-from <malte@starostik.de>)
        id 1qC7SJ-00075k-1l;
        Wed, 21 Jun 2023 23:41:43 +0000
Received: from zen.localnet ([85.183.148.49])
        by mail.blnma.de with ESMTPSA
        id tNNfCLaKk2SEGgEA399c4A
        (envelope-from <malte@starostik.de>); Wed, 21 Jun 2023 23:41:42 +0000
From:   Malte Starostik <malte@starostik.de>
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
        linux-input@vger.kernel.org, linux@hexchain.org,
        stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date:   Thu, 22 Jun 2023 01:41:41 +0200
Message-ID: <2426092.W91McpcXCD@zen>
In-Reply-To: <602504a5-334d-92e8-2fd3-f7e8662b714e@amd.com>
References: <ZG3ipauL9FTnQJiC@debian.me> <f677a16e-1fa2-3f45-2b44-5acbf67aad3c@amd.com>
 <602504a5-334d-92e8-2fd3-f7e8662b714e@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Dienstag, 20. Juni 2023, 22:03:00 CEST schrieb Limonciello, Mario:
> On 6/20/2023 1:50 PM, Limonciello, Mario wrote:
> > Anyways; I just double checked the Z13 I have on my hand.  I don't
> > have the PCI device for SFH (1022:164a) present on the system.
> > 
> > Can you please double check you are on the latest BIOS?
> > 
> > I'm on the latest release from LVFS, 0.1.57 according to fwupdmgr.

I was on 0.1.27 while running the tests.
At least when I saw the errors first, there was no update offered. Haven't re-
checked until now.

> Hopefully the newer BIOS fixes it for you, but if it doesn't I did come
> up with another patch I've sent out that I guess could be another
> solution.

After updating to 0.1.57, it looks like I cannot reproduce the error anymore 
either.
 
> https://lore.kernel.org/linux-input/20230620200117.22261-1-mario.limonciello
> @amd.com/T/#u

I tested your patch before performing the firmware update. Still got the Oops 
just like before.

BR Malte


