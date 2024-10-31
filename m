Return-Path: <linux-input+bounces-7811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 502389B8062
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132C4287284
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 16:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3936B1BD027;
	Thu, 31 Oct 2024 16:41:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7616BE1C
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730392866; cv=none; b=dM7sXH+0uPEx2BCvUuquugR4bFH1Eqm+6Ros7tWIwv50/S573XwGCosZB8uMB5B1pstyc/K/nRRDyZ+nsHubKlMpnW5Sbe+LB9H+AAu/rIam9f0PNG5JE406QGpZBpEQTVP/WAG1GR/PmNEkVB2f5cp+J/cTY7/Dy439eZklJZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730392866; c=relaxed/simple;
	bh=+T8lN1gLzbQbrwa76oDCjzsFDN/dUBtdXM0uxc+LlPs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZD2qATfZQAHYIPnfwSyeuQ9/gdMjYyJ3J7ZJKqsxAJadM8LbkKq00LQAWNSVDU8QkLHbWjQCVjOCxRa23KT2TwG7IihoxIv7yT0fueMJ7SPrmJiWeBCyDZffSYz0RgJhKDwe2Felh8PBhcSt4d2vywjV4sYLQuxGkArlsLq5gVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3bf44b0f5so9153465ab.0
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392863; x=1730997663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5kf59B9cpnpRcxM0Wk+olT2viW8x/tZqSOwO5xKyJ8=;
        b=tMdyG6SuIfTihb+/tsjCjHONo0Ls3ZZpeLlJ40/eZAOMKhcgBfudcNysg85a3higOU
         qimvbLEuFNaghVey3sq9YFhwmh9nFzaIxhK4QWyWQkF5pgamp3NMTS/d1n+SayvIQAGx
         uwdGGsCuGHdRfH+Pvp4400VFrLdw31LJ9DF8KSYkR2zNBfq2KclYUyO1rLwKwc86u72k
         tJ+jzIevZlutKaQNfvTeAjZqLf6vlxeZHt59w0npwpDcQS/wE97/50XttM8UDbuMi+Od
         mCDJqavOjTnvnatXIVVORLodFLXVh8Y0FNsDh1hgJFkOSfrIxbWlzq0/UhRhgU1WlDxM
         k3qw==
X-Forwarded-Encrypted: i=1; AJvYcCVuOns1zu7yT4TF8YYjCNWqO1xr0wCGzSihoKdz3qu/sjm+mO/mU6eXpxW4W38asAeWJhpXACxCz8/fKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrKcjJTGcvox8D08pPtrEAnMcTiqDjE8IXkjcAVrU2TChuZL9
	hCktGWnTgjEe9P1HLYTJ6MR4+vlkCE+YBmp700nfKRzacClecSD8cg9v+6eNdkRcYBBbiwrBihZ
	wIQe59jStGUxRFQ1xYobmhf3MU0ViLtmSriren0U+rHRswFCdCN+LUAs=
X-Google-Smtp-Source: AGHT+IF7vDX78RdpCp96aKe/0IDWhbKJMsM8GMsk5dPvk8HvTRPiy3lCOgNmo7/5JinNDCI88x1azOXCsGSpofcokwYdSk67hVPQ
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160b:b0:3a4:d94f:5b53 with SMTP id
 e9e14a558f8ab-3a6b0384ea3mr6044505ab.19.1730392862708; Thu, 31 Oct 2024
 09:41:02 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:41:02 -0700
In-Reply-To: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6723b31e.050a0220.35b515.0165.GAE@google.com>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk (2)
From: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com

Tested on:

commit:         cffcc47b mm/mlock: set the correct prev on failure
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

