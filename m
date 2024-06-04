Return-Path: <linux-input+bounces-4095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A795A8FBFCD
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 01:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616AB283299
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 23:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F4214D449;
	Tue,  4 Jun 2024 23:26:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3D1442FE
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717543566; cv=none; b=dKg5WGIHbwRcJqoF5NJ5Q+4BwKH2E0KG0LzyOYHcVdkIM8CHfSu+D9mKUpCwFCLpbX7+7sCpTeqmm1ojL4+OSfI+7BRT7sUokQwvMW9QF3fviahgfVvlolny4GGWxrkIplokCg/aLCchjHYb/lUvZXKaMPCTxiIh4pKnswfJ/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717543566; c=relaxed/simple;
	bh=uOxO572PIMYk4UD1AMdP6QiZNSv5xA+cPBiAG1f4D1I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZYrwhAGEMRNsVQlRAJ3GfCsCDX5tm7KvovZk03wG2aIklZVm9UhAycpNrkUMcDR+2RrB4d4weH/mStF/of2evEioMTkgKqlatl0ppiSzgp0mWhySAK8yWcsogxyLHbp8mqa8I2zFFAx1dCbn4qCMBIwe38n5wpH5e2RVJ/wL1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7e6e4a83282so725093639f.2
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 16:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717543564; x=1718148364;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6eAuVeWTDMsF1yEe0WIVH8Cs9Fqf92OWhWU5p1no/4=;
        b=Z5lPCgglUHR/pN/aYlSoaPyBShHdRh5PEk6eR+WtQkeaz/C2+wxFRHTeF8vvOcOsYK
         /efrmryRFBxwg67Cu7lAa6xFa+5ACOYqMS/cF7216RriPYz0pQQ4bwnyXobPlL53CtRu
         9eU0NjPZpJpdccO5L7N21a96a2shCbtvbzaPlLyZL3JBAf1qY04dNtBXq5U9c37+UCwN
         cNNwDRuquIGaSdEPcJ59fBGdvpGBsf5j2Gl5jTRYM6yzsDrFwk7+4iq1cYdtGoCfBPQh
         f+9WEAFx94cdb2H8cQnjC4Z1ozYKxKlZaseARoZDiCR2MlqtW+/g4n5r9d3dlpOZ+bVG
         M6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVnFzP3RcGVmbOFllSENL71u6t0zxVkgXBwMYInCClExisWUjP7u8letkxyhwYDCwHa2i9Es0or1R8s9hBrX6ujJn6CjqOl2I/8/KQ=
X-Gm-Message-State: AOJu0YycrPR3ipVh9XNtyfELG2hYzhLZ8IVlqdIsW3ec5SQIc59l+Vd2
	AxFhHch3RSLlLissrP8bPjaYeyCbZvpUup8/nj8L01erNXJWL69tYfnGyaDKuyUuhlSk/r20T/Y
	0GW+P6vzHBT8tHhXS1vkeZ4/RFp/CqiPkhFAMYpQNWZ+nxsVFV6/xdjc=
X-Google-Smtp-Source: AGHT+IF5vyONmiDcpL1Vn1ikfQ9FuJdcA7AQfBqFl0c9bGxvp4BtLQVTyajhYTtMfn8Ff5AgREPlf6px3j7XUvVzCm5vX4mikeym
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c261:0:b0:374:a12c:30e0 with SMTP id
 e9e14a558f8ab-374b1f47739mr473255ab.3.1717543564732; Tue, 04 Jun 2024
 16:26:04 -0700 (PDT)
Date: Tue, 04 Jun 2024 16:26:04 -0700
In-Reply-To: <0000000000003d63410605a18363@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000100905061a18c63a@google.com>
Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in __input_unregister_device
 (5)
From: syzbot <syzbot+78e2288f58b881ed3c45@syzkaller.appspotmail.com>
To: Henk.Vergonet@gmail.com, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, o-takashi@sakamocchi.jp, ricardo@marliere.net, 
	rostedt@goodmis.org, rydberg@bitmath.org, syzkaller-bugs@googlegroups.com, 
	usbb2k-api-dev@nongnu.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6b0b708f12d18f9cccfb1c418bea59fcbff8798c
Author: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date:   Wed May 1 07:32:38 2024 +0000

    firewire: core: add tracepoint event for handling bus reset

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14969a16980000
start commit:   e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12969a16980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=238430243a58f702
dashboard link: https://syzkaller.appspot.com/bug?extid=78e2288f58b881ed3c45
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1318e162980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122e8eaa980000

Reported-by: syzbot+78e2288f58b881ed3c45@syzkaller.appspotmail.com
Fixes: 6b0b708f12d1 ("firewire: core: add tracepoint event for handling bus reset")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

