Return-Path: <linux-input+bounces-15133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C077BA61D5
	for <lists+linux-input@lfdr.de>; Sat, 27 Sep 2025 18:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D99162C09
	for <lists+linux-input@lfdr.de>; Sat, 27 Sep 2025 16:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB6421D3E2;
	Sat, 27 Sep 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnBycVAz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF782137932
	for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758992355; cv=none; b=MUP/4P8/RvKPqirBFW+cWIl7d2qhlE9KfBUP5XDIdVeVExvXQJuUBbIX266gtCiF412Kf49VBHjQZBcZn2FTi0pYzaQCa+2S5FtidBrIzH3MslftMny8RB+n67pei7b39n8oeXSFPynFjzyzeN4JRkcdNykg2F8g7zlN3/Fz6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758992355; c=relaxed/simple;
	bh=qmBIbxzZKov/ED+JhmAB2TtsB4h5RxXvWvYGjCGTE68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV2l0KH41ec74alaeeyL0L8gxutMb6JmVO9PULwbGOwZHltu/Y36Iv24urrvt02TJLpRp7FZLZVwC7+Vkphxq0gpuSYznRIUT/ZpAtrsPRKh4nJgbVEDvotCp/8YDW923gF6lR+0/V4HjE4xR6mXFVhbiq0+3T0CpBocFwESELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnBycVAz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso2260388f8f.3
        for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758992352; x=1759597152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmBIbxzZKov/ED+JhmAB2TtsB4h5RxXvWvYGjCGTE68=;
        b=DnBycVAzibj4w3MyU/tLxAeQOvu2qpMXbXaLRFmEbZe4KKHoSWBBdIUGovjTR8e4aA
         bJ476hfGXy1r6b6+JoWYK4SQ5/V4D1Ll69upI12t4XPbPko8vwDwSCKMT4fgqCxP5LRs
         ld8McjusZEyb8xOyxEi1KPOZiwjBY6SJAjm9zBwICvsx1cVOboY/uEIEr0Zqn47vmdno
         aJJiP5D2OEPMDD99+SA7eChcRYr1eNab9skrAPb77EuHsyUGa75FoBLDCkaQ9rLVAc6S
         ANCeHyUXTosNokaSwl1/YGJ5tX/aa8VownNwIJ8Xqkx5xc4meqs2j1DvFypmDBHVimFH
         4l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758992352; x=1759597152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmBIbxzZKov/ED+JhmAB2TtsB4h5RxXvWvYGjCGTE68=;
        b=XDiqz6iVq6/G+thWWUexrV7XkVx7D6BAbf9NTmI/mwS7nQq/a0ePOhS8cu3mrylNN5
         7ZPsRbccrpxLC2wFRxtBTjGclKSTgN8e46GHFZu6rgQN/ohBUKmC8wP7a7hyvrQIEaaX
         lR4+9A/6hUUKpE3epvVfe2ngGlyCFSmhC1zbCc+fNuEr/JEi4vtoC1WwRnf81UfOJHyL
         zfuqg2PHdylxBuRUpJ47iY31yAAXtPmKnWvrV+fTxApZUq5POfaQl8xcqqRXibaiD8om
         5HYZ/WcnLMNVEiEKyEPpi/PH5H/kVNPkHmgP95vm/K40q88sVzbUEzXTzCga35pldkJq
         t3ww==
X-Forwarded-Encrypted: i=1; AJvYcCX/HuLpdSCjRyNlMGd1PdR8G554c/wtESTkQqc+HkRp0OMevquEPjBpIheG9TOBbsVrTlxwqTM81xMK6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzudsgRMcAeUaFZn+Br4YG8JizeEo+gn/Ya2BlhCS/nnqGcLj5
	jZWyhA25jvIbKl4rXYHx0/SxzkYaIz5+IlCiHUFATKuZuQ4ClV7h/dVBAZ7EtplWX0VUfQByFCy
	kW/d5uftB8bKmD73jhWQvoZYbNemjcJPWgA==
X-Gm-Gg: ASbGncsh9LpP8LCibtbTAxTg16luYZjD7Brk8URIPhNO47JOjj/9m5IFTWppPf/zAhq
	eFfzkW4lUFgN3iW5qumO+L8VDb91krKnfnlrjoRKEZs8jCp5+57+KopZA3BIEOMsoWqx78whmkr
	IVEshE6uQU7tFqGWKLIi8D7HOyhxKkt0HgFij1aYhvdvNrbm6jgihErF8XlEV25nmNZq7H5mnkA
	lQW79tG
X-Google-Smtp-Source: AGHT+IEHs1T3INbFhpnnVIjbNFXjCfJ2wZUJLPpXF6P+CjIYMuzgWDI+xkcPamFWMTOlGykKZX7I8b9vHMl/0nwLFws=
X-Received: by 2002:a05:6000:4282:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-40e50d6dfa2mr10161867f8f.58.1758992351765; Sat, 27 Sep 2025
 09:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
 <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
 <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com> <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com>
 <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com> <CALTg27kat6CReAvU8nXsVzqKEtzytT+_wf9dZ07OFSke=ipYLQ@mail.gmail.com>
 <848a3c8d-5f0b-409c-b394-1cce6a4c1e62@protonmail.com>
In-Reply-To: <848a3c8d-5f0b-409c-b394-1cce6a4c1e62@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Sat, 27 Sep 2025 17:58:59 +0100
X-Gm-Features: AS18NWBrwLewBH1IlG8qoQCrG0cdQLez2yhLYy8RUDmHw-t3wvhsAw4QgrtqeMI
Message-ID: <CALTg27nCi-cyY-C=Vsi3zXqHsk+M3uMyJ8U35vmxp8YNiqU9-w@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, hadess@hadess.net, 
	lains@riseup.net, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hey, I've been keeping an eye out for the v5, did I miss it?

Thanks,
Stuart

