Return-Path: <linux-input+bounces-15498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C4BDE658
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 14:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2D314E4DF3
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 12:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFBA324B31;
	Wed, 15 Oct 2025 12:08:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BD1E5205
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530086; cv=none; b=axfE9nXVnEfuj+Oi/of55sLoXwcxhXASYaXT0jgDGGN1Wem9AP/mBsYzsZKd3O6lwAOea2xzlCutjcbku5pFVrAyvXkwYKy0QJCbpq53+pF3yPxxzVbUgKIYlSlcgLgc8ikv7NJq/XY7hKw91Q2AzkrRUmUYv9r19x4OHSR/oCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530086; c=relaxed/simple;
	bh=ikafkcyEhGPo6V77pZ1XIeb6FhQLfB2Bg8wg2NG8Juk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iKAmyszGhjiYdtMcg2Ndp2pMcBYjhdCdmRM3q0T1ulXhoHEDJI+eCzRcEG9J1G2J+SrMdKQxA4W4ptelBj6hFmX9mTS8vTNXOVPi/VBTylzaZSgdPMLh4rkAC3VlH6Zq1504Y43ZdhHk3qrCFpj53mU0v2SFwOGGjqPKysEn+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-9048fe74483so1533722539f.2
        for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 05:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760530084; x=1761134884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyldEtwp1gai23TscGVppyYlBhxGh7CjaGIutLSt2gM=;
        b=Q+MSQ1crGOptyQeWpNMRLJy3MNU+/MSi6F8gNMafiCj2UVuyjMvKRmRu0Q/h9izwVR
         wk6jskpxJNsgwUj+/U33uvsErr9v7pPdPBNSLNJwXpjihSgGm1M1YgsDiInHjSayW+jM
         UuqlRY9B/rgR1T2xEhC0Xk0QPx51YnUgBSv0fgMaJTc89Jivn8Pjix9ZkrUaNFsq08E5
         z1OQgv5zU857HdGHpIJqEtlnOXLZDOlnOSg6+z+lFqUHJTpPYKgKDxXylqo6zX0JQ4wb
         c11Pw1Z7bWZbeQdqSaC/uOylIpBgjwKXZU1jJLFF6G2dnbrcg1RDvFWWcYAMZ7zZRgDL
         kV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJZOJcfzE9n3goTfWZsXAhKO42aBLZq8+eBcDdz3K6MP72pOhxDCfFBrYRZHfVppxdfPjvK6nRRxyZoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VD38fYOKpehSKyTK2yVwhMSm5If5ZJ5CueO0OMVDrcFJNeot
	UBBzjkefe7GaEFiKInMvbiZRsi/R8MC315YCh6gT6b64ZlGR3uXPpof5AKyGYa6sLfI4553uQDh
	TiPwhnzJU524Rls1OiaPyzNsdqcoCK1LqilnCp6Pm35hMIKI7M3tDRNsy0+c=
X-Google-Smtp-Source: AGHT+IFUs2xV61Zf0+jSBMVHmQegBSNxFJn0g3yx0KHfRADZU8QekyoZnHSs5fRMGIG0qh5JXRBnChYI8lOYY3pn9m6HByojSwZR
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214e:b0:430:adcb:b38d with SMTP id
 e9e14a558f8ab-430adcbb787mr18702975ab.24.1760530084431; Wed, 15 Oct 2025
 05:08:04 -0700 (PDT)
Date: Wed, 15 Oct 2025 05:08:04 -0700
In-Reply-To: <f945f2a0-c694-4874-a7b2-59cee4cb76c3@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ef8ea4.050a0220.91a22.024b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
From: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://repo/address.git on commit 3a8660878839: failed to run ["git" "fetch" "--force" "--tags" "b7cf8f2fbfc36c709a08e0b9c77990e491473738"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://repo/address.git 3a8660878839
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13bed542580000


