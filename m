Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA461D4ADD
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 12:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgEOK0K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 06:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728053AbgEOK0K (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 06:26:10 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21BA6206B6;
        Fri, 15 May 2020 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589538370;
        bh=GjhxDA2RKzNeJYUxoTNiF+dY0Weh6A59Cpbsz/pBpIk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=u42J3Kar1lJV87G25ONXajxwDbeUaCc1+AaMMqWHhiuCHrTV5i6Vf6lPlhU1UDPv2
         XUswIupYrY1FiN/Zn6MI6EpOtCiA2HCvobFLoOee0XTB4Buwha6dzTD9MhEnr0oVIv
         sYRf1D0emfeF2nkcSEo9FpBGPsZrJJQZa130Mauo=
Date:   Fri, 15 May 2020 12:26:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     free5lot <mail@free5lot.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5.7-rc5] HID: apple: Swap the Fn and Left Control keys
 on Apple keyboards
In-Reply-To: <27588684-a25a-83fd-7204-df3d6c20aac1@free5lot.com>
Message-ID: <nycvar.YFH.7.76.2005151221020.25812@cbobk.fhfr.pm>
References: <27588684-a25a-83fd-7204-df3d6c20aac1@free5lot.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 May 2020, free5lot wrote:

> This patch allows users to swap the Fn and left Control keys on all Apple
> keyboards: internal (e.g. Macbooks) and external (both wired and wireless).
> The patch adds a new hid-apple module param: swap_fn_leftctrl (off by
> default).
> 
> Signed-off-by: Zakhar Semenov <mail@free5lot.com>
> ---
> This patch was created to eliminate the inconvenience of having an unusual
> order of 4 left-bottom keys on Apple keyboards for GNU+Linux users.
> Now it's possible to swap the Fn and left Control keys on Macbooks and
> external Apple keyboards and have the same experience as on usual PC layout.
> 
> The patch has been heavily tested for about 5 years by community at:
> https://github.com/free5lot/hid-apple-patched
> The patch is small and straightforward. The modified version of hid-apple
> is currently mentioned in wiki-documentation of several major GNU/Linux
> distributions (e.g. Ubuntu, Arch, openSUSE).

Hi,

thanks for sending the patch.

The one in this mail was whitespace-corrupted by your mail client, but the 
one you attached to the other mail was fine, so I've used that.

> --- hid-apple.c.orig	2020-05-12 11:06:26.000000000 +0300
> +++ hid-apple.c	2020-05-15 20:00:00.000000000 +0300

For any next submissions, pelase send the patch in -p ab format and with 
full path in the kernel tree.

Thanks,

-- 
Jiri Kosina
SUSE Labs

