Return-Path: <linux-input+bounces-14311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E79B35A56
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 12:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0383F1B245A7
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC52245012;
	Tue, 26 Aug 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HkOfh1FP"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7042405E1;
	Tue, 26 Aug 2025 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205181; cv=none; b=ja/kfLstjjLyMkktrO1vmNPb7a1jQmjsWGs3mFnIwjODxdpxYOGT+hcv23MfCt3Cq1U4HUx7vvYtS491bwEtPj+gvN3n74hWFeOy11tGtlBgTfNr0ZfrgjUGbhyhOPfemB2FVHHIu5Yx8RkuC1JUkMciCleyffc8svE91yjgdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205181; c=relaxed/simple;
	bh=8RBsFaGpQdpk/r1tjWY3brKKD96rF5Y1uRJiIx/QtMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iI1NVi68KjfR7qeQun89HdFIWQhUV3Un2FehLvc73GKSCQdFR/JrFBSvBtcXTtlLSaYVysJGMKG5VS6A7AgHJcfuCFu2lxYWIKbDZb/6RfeWSUfCgGBHciIURXzbDi85naSHztBS+DI9VPgsSfAxKXsTX31zOEh5UEkQvoYR9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HkOfh1FP; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id DABE2BDE9B;
	Tue, 26 Aug 2025 13:46:16 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 49841BDC6F;
	Tue, 26 Aug 2025 13:46:16 +0300 (EEST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 99CBA1FF2C8;
	Tue, 26 Aug 2025 13:46:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1756205175;
	bh=8RBsFaGpQdpk/r1tjWY3brKKD96rF5Y1uRJiIx/QtMc=;
	h=Received:From:Subject:To;
	b=HkOfh1FPoNxtU2Q6m5W8ePadqwQCHJlnnF9lnwaVf0Z78yPECIcX4iCzmWoR8asle
	 0LxNxpeaa04hRSO3HCl+Fpa59FOeCoCq6Hhu5RtJNus5D2j+8VIjFMX4Xty5AwLDhF
	 2s/Wfo0zoBmXATlReQkePUuZS0FaxLv8gIptqRxmf+N6C6eAKViGPSLbWTMIzLxxKK
	 QJNS2TndiV3kitboi/PcunLIttek4KOE5zr+wG68cPnnQiv08OdiXven1anQffpQfG
	 KrnKdln4/wjCdIHzXvJgZ8LKdCMSF2/Ztzp4m+hh9PsHnn4erphGYryaU5kRv8E+2L
	 sB8HNMvrriHRg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3367144d35cso16365881fa.0;
        Tue, 26 Aug 2025 03:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyfzHETI78zqUKKccBTR23X1dnGXgQuFtKWAGse1G3KCWXyxjApt5uh4533ZX3uYiA3J64JPrP5enWRKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNxHg6JAs/vOEQJif42sxl5fdtc34bPf2wHcI1JumvsmH1B5f
	ljecxpCohqmcY0MG8VEQ1YaMh6NMn9c5ErxDXNgOK++RmoXQWViIeKb/Fr8YVIlAYoSdrphkAf7
	DGsSE93lIhubAaBBdF17d3cLdwf+vChU=
X-Google-Smtp-Source: 
 AGHT+IGNYSCJtyb+Td81waXQINU6ky78OWbAckZgFqlQGvZP2+ycfBE+99esKMv1dsCeH/ahJ1vdSLnETMpqEC/zdVE=
X-Received: by 2002:a05:651c:50e:b0:336:674b:e8ac with SMTP id
 38308e7fff4ca-336674bec11mr35236341fa.27.1756205175082; Tue, 26 Aug 2025
 03:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250803160253.12956-1-lkml@antheas.dev>
 <404sp531-6o34-rs48-po90-5276or97q405@xreary.bet>
In-Reply-To: <404sp531-6o34-rs48-po90-5276or97q405@xreary.bet>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 26 Aug 2025 12:46:03 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwH8Px=6X1AnH+3pohqdr9Y5thi6MfzJgOGtPC2c23ksjQ@mail.gmail.com>
X-Gm-Features: Ac12FXxg1pcZi4cygdrjBY3_oxtLyK-pJGI71TIWO3ZLZa2fW2BQyPsKfS2D1ww
Message-ID: 
 <CAGwozwH8Px=6X1AnH+3pohqdr9Y5thi6MfzJgOGtPC2c23ksjQ@mail.gmail.com>
Subject: Re: [PATCH v1] HID: mf: add support for Legion Go dual dinput modes
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <175620517582.2270690.14992991078546330706@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 26 Aug 2025 at 12:41, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sun, 3 Aug 2025, Antheas Kapenekakis wrote:
>
> > The Legion Go features detachable controllers which support a dual
> > dinput mode. In this mode, the controllers appear under a single HID
> > device with two applications.
> >
> > Currently, both controllers appear under the same event device, causing
> > their controls to be mixed up. This patch separates the two so that
> > they can be used independently.
> >
> > In addition, the latest firmware update for the Legion Go swaps the IDs
> > to the ones used by the Legion Go 2, so add those IDs as well.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>
> Hi,
>
> thanks, the patch looks good, but what is the 'mf: ' prefix about in the
> subject/shortlog?

Hm, I referenced a previous commit while writing the header and it
might not be relevant. Can you replace mf with quirks when merging if
it is more appropriate?

Thank you,
Antheas

> --
> Jiri Kosina
> SUSE Labs
>
>


