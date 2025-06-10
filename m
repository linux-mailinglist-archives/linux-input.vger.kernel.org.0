Return-Path: <linux-input+bounces-12750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64000AD2C5E
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 06:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1418816E035
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 04:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5747923C39A;
	Tue, 10 Jun 2025 04:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBEwjnz0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7613184F;
	Tue, 10 Jun 2025 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749528125; cv=none; b=hTE7HxVP5ve5FPESRq2qXbOV1SolLwuMl+lGluWsi/mlj1IlvUdYEfizadHgj4h3BwGYk4X6ohf1Hq85n6MssVXLlxwkmrwte+wH8oEotQSGm+FcGrI8juFTLqx1i5qUVPvWGaIU7YOz6WlkevDboWqWImzrLp9ijNZNO6K06s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749528125; c=relaxed/simple;
	bh=RSDBnhgSDB3LEzKcIyjb9Xjl1Cja0E622WzxOwPUV3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yog2MtKJeS41+Pgy71w7NSV0WqQoAPx6kLaMtnikRoB9oai4E5+/r09IFULBVhgs58cXQivv0OU2HSK3OQoBt5xDRe2Z3lJQ/ctmS+/MqoAYjh5mr7PfLUNmzAJIBnun6iFWvvtl37yDpfBPuIrt8XTBvErfIsn1bIplLCBNUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBEwjnz0; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fb01566184so40977796d6.1;
        Mon, 09 Jun 2025 21:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749528122; x=1750132922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMrwRXbr8WIzpkfgacXKxR5z6ZnKHPCXT4UGv3T6iIM=;
        b=fBEwjnz0+h1vTMCIc7DoFM3MhgLMxGYUuUyTjXVuHkwBqUt0C+EW7e7f0qBny4VTDT
         Txgnjx+uCk8ttxhuVq18z30mo/yy5w1wb33Gm17CSsJIUVcI05TQrPs1XB2chQlGHQ+H
         cua32XG+QMEJGjSfgipWMVB2ThiuPE0XyL7MLxYZgwOUgaWkVoQdRu886JYw6JnTryNV
         R4G9hoRHUWPv9mO9mllcFE9N472s854rtUGNkh40FeYtnyaOmbB6fpsL9eRobqsyT8iz
         Y0EfxO3vn/JXCGDz/O3GCka52Hw/lR5D/DizhpBxeX8jaBRy1RpisXA26iX0EiJffqgx
         /XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749528122; x=1750132922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMrwRXbr8WIzpkfgacXKxR5z6ZnKHPCXT4UGv3T6iIM=;
        b=rTn4gQvnjmVpKJSsjp3ZsgUaCGFdg7fT0xQQBfaBucZwJvHtsTZRJLsTolwb6VGEHk
         3zFUvRX6LTJJlj8s+IZvFAFe9DJtjgLhFt9LOpHgdhtK9RAdoozQD7S1yDHPwWyzkUp+
         GhO/2fPdHC9rzsOPyDs8ftzGW39/Dq/+QhgAnHeu9GxYY3evZJyHtkewjV/Roy7+c41E
         SYS1x9vn7Acsfu8lzdL+0Cg7nU9SQ0xwgvjnhLJQqIdEl4P6VvN+iMQtAjuxh4RVT5IA
         F809+j0zI8ds18aB7rFNqVvfBnVW08Qpas8lC7vy6l4Jrb4/t19sjBEhXzbJGc2keZ8Z
         jvoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6CHh/qwoPWJGE1bct2P0mYkpolx/hBjx1YTzHHoRTTl6G2Xi/gbJsQEDLaNAYXPrMtcau3bwFzBTDtw==@vger.kernel.org, AJvYcCXF3GEn9zVVrJjimHz4wERGuyJG43KZFT/UAAuCZa2j1YWwDaBtLYKT+0wzjafTScr2DXgc5GjFW9GAGxIS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mHrm3gQRNujNu1iUetMhnbZprB+FX/oG8qSEBTDNfwcrWtU6
	KUsYwdg6oGSjfMeQjUvj6z+5sLveaEJKrmW3+06SjEea63J2WCGY/yEhPlR/LIgDtPNbFT7zH7B
	U9HhBnrwqw6fIbhdhDeXGIs6rTeG7yUo=
X-Gm-Gg: ASbGncupXkwXodXuMYmgbMKPmjITWKbPhhODN8LY1zsugudSDq8IddQA0Oqko6bHAr4
	mgLlmtdu4L7+BLjGV7rEKQ58MXX2ve3VpdnAIW/gfYHORcqFzpxiVqyaB/qTZIrjTkfNExQzf63
	poObCtS0VKUXVvwGSawap1Vj/MaDRTT4O25hjnxv5CVBk0
X-Google-Smtp-Source: AGHT+IFkKUcxq9K3TvsZ0FSQ6z9aFHs7y3N1fYKBL8L9OYe5J71fBhdpiu/K3rvtcGkhcagNiThED5dyJXBGR1/IwYc=
X-Received: by 2002:a05:6214:4107:b0:6fa:9e00:d458 with SMTP id
 6a1803df08f44-6fb08fe1a53mr252519166d6.45.1749528122425; Mon, 09 Jun 2025
 21:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 21:01:51 -0700
X-Gm-Features: AX0GCFspEeIQPAzdoMKf0rD0zb01CbCBMtp5pWRm7hsy4HbFty56yWyoLKvtEco
Message-ID: <CAEc3jaCoVgP=0v73ZTeAhd0wb2LpGqguEedY6haNLi_HNA_Mng@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

Thanks for sharing your patches around audio. I need to have a closer
look at some of those and how the console also behaves (we try to keep
things in-sync'ish when possible). I need to double check the
datasheets as well.

The series does contain some other patches around style and stuff.
Some of them for me are entering that slippery slope of what to
change. There are some different styles in use around the kernel (e.g.
uint32_t etcetera is fine). But then if you use super strict mode on
checkpatch half the kernel almost needs to be touched. I'm a bit
skeptical on those kind of patches.

Thanks,
Roderick

On Mon, May 26, 2025 at 5:52=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The Sony DualSense wireless controller (PS5) provides an internal mono
> speaker, in addition to the 3.5mm jack socket for headphone output and
> headset microphone input.  However, the default audio output path is set
> to headphones, regardless of whether they are actually inserted or not.
>
> This patch series aims to improve the audio support by implementing the
> following changes:
>
> * Detect when the plugged state of the audio jack changes and toggle
>   audio output between headphones and internal speaker, as required.
>   The latter is achieved by essentially routing the right channel of the
>   audio source to the mono speaker.
>
> * Adjust the speaker volume since its default level is too low and,
>   therefore, cannot generate any audible sound.
>
> * Register a dedicated input device for the audio jack and use it to
>   report all headphone and headset mic insert events.
>
> It's worth noting the latter is necessary since the controller complies
> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
> advertise any jack detection capability.  However, this feature can be
> implemented in the generic USB audio driver via quirks, i.e. by
> configuring an input handler to receive hotplug events from the HID
> driver.
>
> Unrelated to the above, also provide a few driver cleanup patches, e.g.
> make use of bitfields macros, simplify locking, fix coding style.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (11):
>       HID: playstation: Make use of bitfield macros
>       HID: playstation: Add spaces around arithmetic operators
>       HID: playstation: Simplify locking with guard() and scoped_guard()
>       HID: playstation: Replace uint{32,16,8}_t with u{32,16,8}
>       HID: playstation: Correct spelling in comment sections
>       HID: playstation: Fix all alignment and line length issues
>       HID: playstation: Document spinlock_t usage
>       HID: playstation: Prefer kzalloc(sizeof(*buf)...)
>       HID: playstation: Rename DualSense input report status field
>       HID: playstation: Support DualSense audio jack hotplug detection
>       HID: playstation: Support DualSense audio jack event reporting
>
>  drivers/hid/hid-playstation.c | 885 ++++++++++++++++++++++++------------=
------
>  1 file changed, 500 insertions(+), 385 deletions(-)
> ---
> base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
> change-id: 20250522-dualsense-hid-jack-d3cb65b75da1
>
>

