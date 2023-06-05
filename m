Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D841B7224AF
	for <lists+linux-input@lfdr.de>; Mon,  5 Jun 2023 13:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjFELfV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 07:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbjFELfT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 07:35:19 -0400
X-Greylist: delayed 144 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 04:35:08 PDT
Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DE31B4;
        Mon,  5 Jun 2023 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
        MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q9kK4FWpujilN7N4KgicC38GOFmjovQF+Cg7lFXJo9s=; t=1685964909; x=1686828909; 
        b=mIm3mtKmWcTuJfqW/ecAVt8OkMD/YqueYAo8Y1qURP9nYkpPXhBJFD3ocU0VV8C/wOK9wsVwafR
        2htn/Diaks36Z4QB0hvtNtGodOpcwSrQRmNB/uklxZJQXSJcWxn6kUrgyqnSvZ1LANNy8TQhFmdc7
        GjRDYoUNYEGJxqnh0MqsWmYbDd5cjloiwB4V6lQcWqHjJeoRwBOSNSDWu0cX8Jnch3SZZJRtQQ6HO
        tSGe2FHhS4tPmYsezsaUBU8iBGDXZmbMbMQLT0/9WJAXlk9q2isSPz1NydI2Cp4F1isPPTqfWgbn1
        50nm/bqb+Cr5HDDaLBCy3zAEmTONXMDyNGHQ==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
        by mail.blnma.de with esmtp (Exim 4.96)
        (envelope-from <malte@starostik.de>)
        id 1q68K2-000D3H-2j;
        Mon, 05 Jun 2023 11:24:26 +0000
Received: from zen.localnet ([62.214.179.90])
        by mail.blnma.de with ESMTPSA
        id hgEtK+nFfWQPPwAA399c4A
        (envelope-from <malte@starostik.de>); Mon, 05 Jun 2023 11:24:25 +0000
From:   Malte Starostik <malte@starostik.de>
To:     bagasdotme@gmail.com
Cc:     basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org, regressions@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date:   Mon, 05 Jun 2023 13:24:25 +0200
Message-ID: <3250319.ancTxkQ2z5@zen>
In-Reply-To: <ZG3ipauL9FTnQJiC@debian.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

chiming in here as I'm experiencing what looks like the exact same issue, also 
on a Lenovo Z13 notebook, also on Arch:
Oops during startup in task udev-worker followed by udev-worker blocking all 
attempts to suspend or cleanly shutdown/reboot the machine - in fact I first 
noticed because the machine surprised with repeatedly running out of battery 
after it had supposedly been in standby but couldn't. Only then I noticed the 
error on boot.

bisect result:
904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
commit 904e28c6de083fa4834cdbd0026470ddc30676fc
Merge: a738688177dc 2f7f4efb9411
Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed Feb 22 10:44:31 2023 +0100

    Merge branch 'for-6.3/hid-bpf' into for-linus
    
    Initial support of HID-BPF (Benjamin Tissoires)
    
    The history is a little long for this series, as it was intended to be
    sent for v6.2. However some last minute issues forced us to postpone it
    to v6.3.
    
    Conflicts:
    * drivers/hid/i2c-hid/Kconfig:
      commit bf7660dab30d ("HID: stop drivers from selecting CONFIG_HID")
      conflicts with commit 2afac81dd165 ("HID: fix I2C_HID not selected
      when I2C_HID_OF_ELAN is")
      the resolution is simple enough: just drop the "default" and "select"
      lines as the new commit from Arnd is doing


BR Malte

> On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
> > > What last kernel version before this regression occurs? Do you mean
> > > v6.2?
> > > 
> > 
> > I was using 6.2.12 (Arch Linux distro kernel) before seeing this 
regression.
> 
> Can you perform bisection to find the culprit that introduces the
> regression? Since you're on Arch Linux, see its wiki article [1] for
> instructions.
> 
> Thanks.
> 
> [1]: https://wiki.archlinux.org/title/Bisecting_bugs_with_Git



