Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5156D1C97A3
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 19:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGRZS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 13:25:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:54398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbgEGRZS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 13:25:18 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70AD320A8B;
        Thu,  7 May 2020 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588872317;
        bh=0hVoIDZy9AMfK5oLVFXR6QcoGQGRqyyEMc5BGHJA5Ro=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WFr0jpGb0RaXq1QjTETgKMSSWQCNrAspzrY1b1X6O1k4eBRJh7yewzNw74DI/L8u9
         r77aeNvTYkMbIseF/8uWYdilEHDNZjsl42sFgNP/8oznIb2aRGyVtmk07dJGvsnf98
         TcXcrL1+IaUriCCogWG9r5NvTQJTV/zbANn45vLk=
Date:   Thu, 7 May 2020 19:25:14 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: linux-next: Tree for May 7 (hid/hid-asus)
In-Reply-To: <937ea192-1702-7ecd-5b90-d281a20f3c8f@infradead.org>
Message-ID: <nycvar.YFH.7.76.2005071925000.25812@cbobk.fhfr.pm>
References: <20200507181524.728b6b10@canb.auug.org.au> <937ea192-1702-7ecd-5b90-d281a20f3c8f@infradead.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 7 May 2020, Randy Dunlap wrote:

> > Changes since 20200505:
> > 
> 
> 
> on i386 or x86_64:
> 
> ERROR: modpost: "usb_hid_driver" [drivers/hid/hid-asus.ko] undefined!
> or
> (when builtin:)
> ld: drivers/hid/hid-asus.o: in function `asus_probe':
> hid-asus.c:(.text+0x60f): undefined reference to `usb_hid_driver'
> ld: hid-asus.c:(.text+0x689): undefined reference to `usb_hid_driver'

This has been fixed in hid.git earlier today. Thanks,

-- 
Jiri Kosina
SUSE Labs

