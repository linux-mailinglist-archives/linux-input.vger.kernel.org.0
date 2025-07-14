Return-Path: <linux-input+bounces-13534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC1B04810
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 21:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7301A612F5
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 19:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846242309B0;
	Mon, 14 Jul 2025 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iZkkifgV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8406207A2A
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752522534; cv=none; b=bnmcend6AJ9J/CfSX4atoGyvd8/V2qwE6YbTB6ajlOEuguSSYY4bLkHstLZGwnxSX+MONUjt+btgQ90HQkxtk1pK3YRTtnxADovg+4OzBWUHy5cH3XvVWkxix+HPlmeHPbGog/nbKzSBF8VeyaoyarsiYtIyVeAVhT6aSQVmI08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752522534; c=relaxed/simple;
	bh=/OqO8KrP3XFMW5AC08c4eVH2qV3g/0RAGd61kyJsEMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ7hw09vsZeTrNB33acyFB3AEGiSyXedOUGRonShkQEaIG6GvHtFU/+IVd9zwxQwTtvT0rI2M/QrXc46+A2N4PYqPtghiAV3y+uHPWmY8CfmuP7j871pfudK1tluwIlwBttLycVGz3SqSFVSd4SFs96IGDtnLrUYaw6KvZOAN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iZkkifgV; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e32c5a174cso97984285a.1
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 12:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752522532; x=1753127332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdmQGkqaTRtELb9tyNiAvIlRJ3GJE9Ml7mc5y7fdsNg=;
        b=iZkkifgVGVUttnJ1l2Ph3DbPuk7VR6WGw6lWy4hdElMvPLG5oI6LqpoJbeEVGtQo6a
         t/UPSCHuqOnm+JOF0G1V32x3DaX7R127vDRnOnVxSE18E3jg/XZ0JR2TDfLWLJr1JlWp
         6itTGfYoYkycHGxXNMdlWofpGiVgm3YRRu+pb6EjXDyZBwNaFKRsS62Eqy0UVz6ukR+d
         SKcAEmjNpIMdWBDTr1tk3BSpFr5p1guuV3JXN2DlRhEXjkWvV/J2HiM+87+Tvy/0ceCU
         M0R9zk+E/WfwOOFPZBPk7fxEGEYU2WxP90wa0C18W3tFq+G1lU2SZ2yQP55CZvfPsyWk
         VGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752522532; x=1753127332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdmQGkqaTRtELb9tyNiAvIlRJ3GJE9Ml7mc5y7fdsNg=;
        b=inXWJ+v8zIo+RYoNbwHUxd5bJpbbApAg/D05nOxcdyG0Iy00ezVG/9Lq7Eu54vHGGu
         Qgi3ZVObc7rO1Vcpjdy3JTIl0IEBEruvEdXHM4j6bcExPxbm0+DjQVuQe6vCEATp2J02
         tw+TDIKfXflo4OwU2vVB1O3EGIT//g5g+znWHr4C/KEpKaLD1G17/6ahj3eB5849WUaQ
         CEK0PQG1RpDiR16NwzhnBOYPkYDVoZ1RP1s2rFL2e96JwuC32wFzjmzIB/7u6zsQ1KIa
         V12F1FC1KcJHO8TjAs89nSULmh6OlNZSuOVj+Kp843aIW5wJ5yL1/XWSD4rpCRf1dm1c
         Zmeg==
X-Forwarded-Encrypted: i=1; AJvYcCXghXevL8Kt2X8H1K46HII2BxWiKJkrgeBJh2sWjaNX5v3+dKXWV109m/obCxXDQglyfCUQLUcqX5R1rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAabOIy7B5U185kEOwSKuP/Augv7ED+h6ixLXlLA2KVeQHcNw
	JnATAA76VSuBMmR/R97F7//If4Hl/NsyIybycnVZfrWOmZqRMcDnRQlGzNRhiT83IQ==
X-Gm-Gg: ASbGncuLK3v6PYl2f9MatOd4dzsR/8kfsHQ2B05+NR2Pep3xki/koZaA51fVE+RYpFB
	9jK0AlyYNZKKAx0FK4XaoVcFcJuT/e6twvReMKEJG9iq7Ec5sVAwDPSdE+6mBS/UEgoPkilfqRE
	WVjgfaD40IxxTHF6qRGHSF2ydzP+6kWCAHimqbE9PE+Q7n2VFsoKaLkxVY04oVk4vMW9Halh2pv
	P40eCz5P/1zD4y0cAoT0gmIK0b9jBh18k3eWBA6p19f9U2lMYhI1bi7dPGlhYvKRn8gc0tvu8mP
	wLgjoxAmHgX51CtTD90hkSn0n8lRVrlxR0uYfjQIvpS+FzHti8uLhEhvWWQC+7Jxf2qY/CF+tHE
	s6np9qa7D7DfFRntymABnsxyX79i/0/rkPQ==
X-Google-Smtp-Source: AGHT+IFTA2R80j9SbfaEXRoWmzMLYIcjed2smzlomYCQTMT8aZeLxjZsPC8Si0dahaqbmaH2YaZPsQ==
X-Received: by 2002:a05:620a:1d0a:b0:7e3:3288:8ec3 with SMTP id af79cd13be357-7e332889121mr347701285a.32.1752522531624;
        Mon, 14 Jul 2025 12:48:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm50884366d6.18.2025.07.14.12.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:48:51 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:48:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <ea7f1f42-273b-4c07-8bf2-769992dd9ced@rowland.harvard.edu>
References: <68753a08.050a0220.33d347.0008.GAE@google.com>
 <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>

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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f190b6

