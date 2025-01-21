Return-Path: <linux-input+bounces-9424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A4A185D0
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67EA1885680
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 19:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529161F4E50;
	Tue, 21 Jan 2025 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTKBi3F0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955791EB2F;
	Tue, 21 Jan 2025 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737488861; cv=none; b=ivo5Yq5xzZL7h367GqUTjfKgtSRt7UjLBRFDoEdn7XRbN43mrq3VV/Zk0oZCzQogtgL3bRBWrtVIHvcgKlYmfNusvMnzMQ509tGjlOmw7ZtNgd8SzvptpM6ehc8WX6mFujrOEYlmQa5H8MaHNJfWFzTHGjnWrjsxvfXibYxVssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737488861; c=relaxed/simple;
	bh=LIdX0OZPc62iBlZNknRKXsaW2F0Mq3ALwvzERoG1wJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQoIzv/EhVTDRUnKKQ4Bnpwxl+AzXTuH24RQnynfg3sUhwnplwR7pUkqXTysztadBJiVjcdA9o5R4tY9valvAJilOT+JCeeWtsyR+kK9l+kawxjUZLiYDFTtdfSYjZOx3KjT05USLi0y+hX6Vx5fhJlNmQ9r+Q/BdYZmcck2AOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTKBi3F0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5045218f8f.2;
        Tue, 21 Jan 2025 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737488858; x=1738093658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIdX0OZPc62iBlZNknRKXsaW2F0Mq3ALwvzERoG1wJ8=;
        b=cTKBi3F0l+HDSCDUl9s/sveYLe3CixSI3+7OPMNdWOGt1KYP/gUJKrqJUj+2f/iJdA
         cPJHIji1dHWzbc3Ag4SbRW7SYfz9oyh04vaVLibLvjbUk97X6RxqSZckqcQVoZHmwIMw
         BkLBAriORQdAYByZSRz++qzRrTHs3FQgjLyFwsy18Ulk2WfRu7AZG0YV4/ibEee36jYv
         QFuqPALHFb0Eh4UihtUId3vLXr7uvmjrkPyv8Wh/GyWvkHL47DKAoeaLQd8wv1hTb9Ht
         k7B41xTzhxQXkPP7P1gq30G2Ep8ZJunthFq7hzsfP41V7+M8p+B4ZQ3le0CXmOLEC9jn
         4qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737488858; x=1738093658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIdX0OZPc62iBlZNknRKXsaW2F0Mq3ALwvzERoG1wJ8=;
        b=VoqdyIo87vPD0StVwHa9h3xfHybNTmkU6ZaNPh2vXJyP2DK0W93KTTqXUDnmITZgwn
         xfaMLstsyWm65tqrzvFMob44zL2WGZkgkxljC/qAAFGgMTkLYo4LkJ/pHXzC8b+DkiAg
         Zj4aIU3WcfxBNH9JLXoUDXTtq7wpm1+qxmH9XIKdeoRKy7aKdN4oS5PuJAWqsKwiBtWu
         3ZNjDatSxzJi8/yETd78kM5ieluKTU5197L3ncUaM/Qp23b+I3fijIMiHTTt4wN8Iifc
         LVYKoj2yd3Et0pPuXk35PANomAZHLpyR448Ff28kwItmeKyXfMB9sFZw9TKwMsxkob0W
         su/A==
X-Forwarded-Encrypted: i=1; AJvYcCUph92MhDoGlkABqssPIch90lYDkmjgy6Vf5XITkNjFMr/u62Crlg21dlfAWs8lnUNXaJTxRroW@vger.kernel.org, AJvYcCVuKp7mFpB/TJysZCTplqhB8BOku2MUpqYP/wNShRfZIXSRhVxD0XleNHlB9SIaj8LF4Xhvm17xEsWX+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf62HuK3E9L0si5QihriEnCRaxvUH5vVnJvKTGazhNY9eIZhk2
	mDXIx9cDxYVH0WDAtNINgvuGgLULEZXuCKUcwRv+YbbYgxwMd15ot/j4lytj+JixjDsRT1/CYzk
	feCG8upJkhmVQPPCOFXFcDszXuBg=
X-Gm-Gg: ASbGnctutULxKJhgE6p0SJD7svAVdiGNW9f0413AHwlszSOldivYZo0aCIc9adKyGIe
	9yV7fzP+Ip51T3YNvCaEr4sJZ+eDGx+8YOZPKrYsN2/SDl7Y18zEJ
X-Google-Smtp-Source: AGHT+IGjBlIa+jSUNCbzGDIp/uDnWT1jNz1apHM9LKSyGLppoOfC5xXFWJDxpCvhtiscn3n/s+2qae8fyQeZaeH43eM=
X-Received: by 2002:a05:6000:1a87:b0:38b:da31:3e3b with SMTP id
 ffacd0b85a97d-38bf5678466mr17208861f8f.3.1737488857835; Tue, 21 Jan 2025
 11:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121192444.31127-2-stuart.a.hayhurst@gmail.com> <3q9oq173-09p5-o64r-pns9-44q308nsnr01@xreary.bet>
In-Reply-To: <3q9oq173-09p5-o64r-pns9-44q308nsnr01@xreary.bet>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 21 Jan 2025 19:47:26 +0000
X-Gm-Features: AbW1kvYh-S7TyBLm55dLBUUOuCkI6yVRVxBTFpPFJluT6Jy_E0k3MkVsGj5PVKY
Message-ID: <CALTg27mHHtWrOrgw8GvbcKK_+QqkS6AV2GH1s6On3_dL4yaVgQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] HID: corsair-void: Fix various memory issues
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-input@vger.kernel.org, 
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, YAN KANG <kangyan91@outlook.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Are you sure you got this time this time though? I again got only cover
> letter and not the actual patches :)

Yeah thanks I just saw I emailed it to myself instead somehow
I'll have a couple tries with --dry-run otherwise I'll clutter
everyone's inboxes, sorry for the extra emails

Stuart

