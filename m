Return-Path: <linux-input+bounces-13618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD5B0C773
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 17:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77BBD1897748
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 15:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3262C2DEA7A;
	Mon, 21 Jul 2025 15:23:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9912F2DC33A
	for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111385; cv=none; b=ETN0+ELpyHGXIQaRv0ITBrf75z6CDXWJMtlUl4en3NdpsKK0nX4gH6pMyPuNF0Tuxvg8PPMNRSiU01JR0rbH1GEvqRwQMFK4Ryl08SbayZXD+Ur+m6zNhwMJ4sNNsriaMl8N6OcUFEGyuUUOE2wsfOoclDwlpsCyX3eOEFddJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111385; c=relaxed/simple;
	bh=vgfQRhOfNJrtc92tlhGLleVrfKnZFO6SQWjGR5M+Lqs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HaiZZrwVBQQ4LwK2JHFCvEbaaqhMEgaal+2BhxhUr2AFW99X/J3jQGPsVulCAkqFuHKq+soBiScS1TPQPW/mZGLsyVQBM6wuC9U53UuQBPGDd2Zz83r8ZYhO61cr7ho2LdvM4iHSIqKjHDNr1JosnaZRpFBstO1YYdaJ0q4145M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cf753423cso422108039f.3
        for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 08:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753111383; x=1753716183;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnnNzxl9T4wc5fvQhb3X2ZvzvD3sDYfo1Lw48SOD28s=;
        b=Vh6Vy6bz6uljjvUC9Fz4KWNOxxhTOCYsBRjjjK80qG7jDDsysP8cwjS3Jkz64yGN2e
         X6urT4aeBmFiIN+fWjHPdZ/txqp2hdXneJMTr8nKUUPC630XwZHgP5hMT0L5cBq7JpxB
         qbnU9qdkLnGIMy+vqVupACPtnzihgIkqpr9PtiiSHkGLYyffO/PoNLH5YLp1lgcMrjcK
         jUSsxvvGOT11WLFgkJIS0ePmNxZ2fLDkRKm//XSK4qZl9JgnSXCIPVykHh3CL9mHY3wR
         aQdDh4kdGJxUQ0sx2txZV0RwGe/8LvALsZ07h+hLB+CFkVP5n54wh1QNCDMvJEOGvF4t
         RIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qlvnuMQSchDm6rRgHBjShO+jHAX/Q7oA3DS3TfpjotEY5O2N1uZ/W+eBZ8BfV3jiX+SBj2BoSNI4Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05JlbttLW/mei6f5GiF1riLjY7Q5BGOdLnpS7a2mTbhn+meo6
	2pBWG6ub1GZ4z/cAkSICxdlo/AWCAHmc+IwGhtD5Ra9EonqnV6dSMTw+IROVGOyN9At5AFlf5le
	iSHjERUrnLw9HXgs0yIRWg3STpZhSeAkXacdUuY2/QOiwU0h4vpsy24QS7rM=
X-Google-Smtp-Source: AGHT+IEXJhlHzdW25N89aTvgF9cgYyQhljvPvgMzdWEjwvMjmJsRZj/gTeEpluzGFnZtI6hYi+7Bqbib6cRYF2V5JqkqAMLadrRR
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1490:b0:87c:1237:cef7 with SMTP id
 ca18e2360f4ac-87c1237d278mr1777230639f.13.1753111382796; Mon, 21 Jul 2025
 08:23:02 -0700 (PDT)
Date: Mon, 21 Jul 2025 08:23:02 -0700
In-Reply-To: <cd6d1bff-7912-4c55-b2fc-ea2032658ca9@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687e5b56.a70a0220.4e1c.002a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com

Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16f4cf22580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=142bef22580000

Note: testing is done by a robot and is best-effort only.

