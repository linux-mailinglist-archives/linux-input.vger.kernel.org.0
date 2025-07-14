Return-Path: <linux-input+bounces-13532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9080B04770
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 20:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119661A6256C
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 18:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D6273D95;
	Mon, 14 Jul 2025 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gKsa2RFN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1026FDBD
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752518330; cv=none; b=jQAJh3Q6wEkqjY2YhRmJLBdT+cjKyZIkuPHNJcLViylmI5/gx66ZNWqppK5fZwvCnUqLoiG3HZJ49iUO9cQINvkcmra+p2/N23U/S+3OGOJU1qfjZpJQ5aC57xyjdekCt07gIEkbW0r2Sfc9PGsIbnARJQjqUixBtMWVwJfe4R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752518330; c=relaxed/simple;
	bh=v+uq+g4OyjBweK0mxCHTIPrZkKjorfxmAUt1H4XzEpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4v73/jfrakgsbPTI+vl4+9v+TMYtSjkEE/yxUZlmCSrYALJ0iX1gUdlC3E3RDGdaMRl3+Yi50u/+/g4HoArlVmDBfdz/3o48oRyosaNjvrXBHX4jMM3ymi3TGBqy27fZdSdb/bhBtRASRnjv0UIj99n+1tcK4WBCCTFPeaYSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gKsa2RFN; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e32c5a174cso91155085a.1
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752518328; x=1753123128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ81tyG6lDybUwtkVxIVT9Bpwsku1w3Rk2LkeAkSMy4=;
        b=gKsa2RFNOzYe47ABWTkgzZeEnRNvn3mL/LAGBBHRprHTmv98w5sPtBGN0yBZz8iVWM
         hA8FKzBTwkZUxGwfoYQiAuWsaU4ebTK9oyMCnoaDAwvDEyFYf8BHHye1pHj7Znc3Xvmr
         eEpVkmlPVVd5MYtTIH4wvz3LtoiUVzQhYk9XBGLAz+GB1KaK4pgz3/mJOa6Ca0JB3/Mr
         6AQhuPK7uxvYWcg660krQKLn5YayFybSoyCwq+iqtmaI75hcLP1KFRFhIkTlBVwfJDld
         pLMk6xgCUx64X238yQLoy12zr7n+glm34b7eRC8EWrDpX4Jr/qEi6lkRlUssEitbxs15
         1zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752518328; x=1753123128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ81tyG6lDybUwtkVxIVT9Bpwsku1w3Rk2LkeAkSMy4=;
        b=FAG01xYgmRa72J65tmaKBI61DQ5EigIc8Dun0davxxTwI7AICuZGnqr4ToTaM6hR5F
         m91ezjMvAGOqOxcFMziCVhCZXjyMgDd6AdTxOSNxVCmfV7I5QopBW0tlQnlnkxOY3zm4
         jjuwuAK82wTDWjR++HCGaYX7qDHuNqRi8kxpuQHOE+BVZ1aVrMYcs7AlTQ3h+v0FMVQA
         YdjmA2x3ccgq/lyhcZXw3PkPbQRQHHacrI5sLcJP8w1WELQ22KjCrza6pOyfWs5HCpIB
         OjAsV4cVlQRP2bDqsdOEMu5/XOHI5e1aIG8iv5uDIY30BgmaN49bqJsGTg1c9H8nV0NX
         u5hA==
X-Forwarded-Encrypted: i=1; AJvYcCXVpNndRbNMB8JZlGVNFdbV7K7tWlX9Dqp2eUToPuVrxFH66j9GihJMyS0pplCo6yPCgCqxtfxv2bqOFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCntOSNSxM7Kk/MNv3eMevYeBdQ2ouvQMtzdullDdmHC7JhiHR
	uoxqGgIWSC+78ABkz3jAtRA41l65EvPNoJC+sGv7hu/vNmHTbOfgzWGtG0nydJ5nOA==
X-Gm-Gg: ASbGncvoGH4IK7VV8yjNHsdGHqKuIjm+2FbB8WobeRulslC8CeakpBzE2NnOLKjrKGB
	W3lftNFw0Il66P/93eetemgHHUAn77aAz08OelezwgPpmquWGReUp7K78fCiQO+cChePgbPEjUH
	+7Zh/9wrINJVLnKUx43yn8DRnWmdxMbmAzAHVPW01qo9MWbwOfTnxrQkK2svr7M7iFbWLVGWyJd
	xwceAPiVpA/bKl8hmM86Xn3/lnQuiUlNGbEAzuuR5XGkFWxL382k/ZTSzmD63utHfpyaTES4arG
	L7DukU+Y5WxWxMdvRRvAEGN8gxH0VE1jD8Kixt8PwJviBQnem/05mzJOX1CmwxtJPez+YTzDquC
	f8zsirVAEUAuP42xC4H0bUk4=
X-Google-Smtp-Source: AGHT+IG96/g+s03fjfH//zQP0o37+NStU8GCEDW/E8BjA9gFeNY6DH3IzaJB4R8vrILfEL1S691pzg==
X-Received: by 2002:a05:620a:319b:b0:7d3:90b3:28f with SMTP id af79cd13be357-7dde9b5fcebmr1881696985a.5.1752518327948;
        Mon, 14 Jul 2025 11:38:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e334178dc8sm54274885a.8.2025.07.14.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 11:38:47 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:38:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
References: <68753a08.050a0220.33d347.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68753a08.050a0220.33d347.0008.GAE@google.com>

On Mon, Jul 14, 2025 at 10:10:32AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b4b4dbfa96de media: stk1160: use usb_alloc_noncoherent/usb..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=15a830f0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
> dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614418c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1257dd82580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/7301552ad828/disk-b4b4dbfa.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c559b38fa1b6/vmlinux-b4b4dbfa.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9c1da8b2a83f/bzImage-b4b4dbfa.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> 
> usb 4-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
> usb 4-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
> usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 4-1: config 0 descriptor??
> microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> shift exponent 4294967295 is too large for 32-bit type 'int'
> CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc4-syzkaller-00314-gb4b4dbfa96de #0 PREEMPT(voluntary) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
>  ubsan_epilogue lib/ubsan.c:233 [inline]
>  __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
>  s32ton.cold+0x37/0x9c drivers/hid/hid-core.c:69
>  hid_output_field drivers/hid/hid-core.c:1841 [inline]
>  hid_output_report+0x36f/0x4a0 drivers/hid/hid-core.c:1874
>  __hid_request+0x1e0/0x3c0 drivers/hid/hid-core.c:1987
>  hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
>  hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/hid.git c2ca42f190b6

