Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD45E3D8AA7
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhG1Jb7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:31:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231392AbhG1Jb6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:31:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C34760F6D;
        Wed, 28 Jul 2021 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464717;
        bh=9SasO8pvmJqP3IwdBZP3mWUA+TfEYlcFAekW9WY4gds=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QfFHBDIrd6j6WQhajeF+53TL907IYyjdLgIH0wMbMQNBznmfWfxZmdPyrvxgsZYnB
         8brJMcrIrzR12LPT/xr3D52C4i/MoRcSSagLFAcyy7NSwUyMjihIEPlLw8wQR7i4vh
         qsXOe5NgGxWBAP1/cAEEP2jpry7OjbORE0A+kHTx1RKMzL3s/4OnneoxQVHzygWeJv
         cvdmRhS4QgWZB27WIEWbKYIZYJ9sceIjNor84zsbAgi2nuCT5f+AEIY9D9LULrk4DD
         zzBf67oi9K6CQvQR6TlZZwsP6JJb7F0/90N29Hr+jh64a2XNv20dwVxdZrAR4QO23I
         nGK1rzlmg9uSw==
Date:   Wed, 28 Jul 2021 11:31:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Anirudh Rayabharam <mail@anirudhrb.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbhid: free raw_report buffers in usbhid_stop
In-Reply-To: <20210623184030.17281-1-mail@anirudhrb.com>
Message-ID: <nycvar.YFH.7.76.2107281131460.8253@cbobk.fhfr.pm>
References: <20210623184030.17281-1-mail@anirudhrb.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Jun 2021, Anirudh Rayabharam wrote:

> Free the unsent raw_report buffers when the device is removed.
> 
> Fixes a memory leak reported by syzbot at:
> https://syzkaller.appspot.com/bug?id=7b4fa7cb1a7c2d3342a2a8a6c53371c8c418ab47
> 
> Reported-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
> Tested-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

