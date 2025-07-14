Return-Path: <linux-input+bounces-13533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AEAB04785
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 20:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906383A971A
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 18:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B9127701E;
	Mon, 14 Jul 2025 18:50:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715027604B
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752519004; cv=none; b=ZQznwvMatud5yhly9JFSkCJ7E0uv1N7erGO9lPBjiLx0yIXeHWG+I06+HWQCZUZYQLd82C25QFrzFyOr7UNWdJPifcXROdsCCGWYiCVzXnNpS4eD/i99GjeaTPjpC5Pw8tuk2FgwmIm10gcR/XEAAakbFUiRqNZ9v1yZDAlKGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752519004; c=relaxed/simple;
	bh=sL3Ty6zb90cdZAu3orpLPgO6y1Pv97CVNHZeDEtIJI0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YWAVnSFqP6Ht0SsAlkFhKob9t+IUlhW9uFTkv0CkZDlQ3xcr5QW5AFk48uMjX8KL9a7jsdNWZa6vcO/46QR6k9wBEsEXQLim5GhWa9yRHrzsaoGIcdxkFhGKX76JGNU/03q1dzD6Kc+eNYfEa13Z01wn6xUKMaKGSU0bOk3FJRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cfff5669bso458434339f.0
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 11:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752519002; x=1753123802;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD+SVBl8w3djGHImI0ouoaCds+D4brGq+H/e+A2QQA8=;
        b=Y99ehTIsdKiq1A+GrBKJFO8vz/rWkdoBDs7SEw7+zsI6D+pzJMcoi4s8Cu6Hwv5lC2
         W0VT6aYO6Rqg/pXQoMh+iKlT1JF9DLqBLACE+iLApyhAyTn3GuXT0mzzvNGyKy/5IZvU
         u5+xbNCi+eq1n0TTTFNMpHB7UAu7MZiH/ArMMhJ71/drEl2TL1dPbmCC8Wo9qUZ/USLE
         0wLY2yj/AqSvCWWUGNmACBRhlTC2ej+Wu2yKrzBeomEMhvf4CcpKUVHHNQ8Ht55p+TET
         rfMcX+qvbN6RTWDtHbO2MM1UnIBB54uWcLGps+CkSRGZYU4pjcrQuJORDvtIwjY/wxYo
         SpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD4Gt1tg3ZE+qbaeRh682YpktyT6+wl1lOiytV5lOtNf4q2Z5gNao+8cN44mmY7aLTyw+IgNIalitgKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+gD5JPixxW/+CqGHNBnXCRvh9VHOw19BDpwYKHN0HwVlNhkd
	3EbaGil1cnD2y93b68a5SXLjg1Ze4Qk7GxMz4wc6joBnFf1CBuB2zA5LkqYG5MJyuchLZijrg5x
	Qr5GXaaz9ku+cX0cGWEx84jZKx8HYoSzCqIF75nA1+LWkxP87dJBcjxg5gpY=
X-Google-Smtp-Source: AGHT+IFzNT+ecM3Iao421peKAwInDKwETKEbMkk8Yte5dfJG8bGYr6cgBOlEREmDlx69Fk8YtdQEjKR2+ZeBTJgp7PRDfp+n2UjI
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2bf0:b0:876:737:85da with SMTP id
 ca18e2360f4ac-879aec80118mr86370039f.0.1752519002324; Mon, 14 Jul 2025
 11:50:02 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:50:02 -0700
In-Reply-To: <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6875515a.a70a0220.18f9d4.0006.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/hid.git on commit c2ca42f190b6: failed to run ["git" "fetch" "--force" "--tags" "0d6f9bdf969aa7d8637c9aa20dfc4a9cfc8f96cd"]: exit status 128
fatal: repository 'https://git.kernel.org/pub/scm/linux/kernel/git/hid.git/' not found



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid.git c2ca42f190b6
kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       

Note: no patches were applied.

