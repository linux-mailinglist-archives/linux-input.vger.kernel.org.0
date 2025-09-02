Return-Path: <linux-input+bounces-14413-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD145B3F57C
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 08:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5A93A3D16
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 06:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4AB2E1F0E;
	Tue,  2 Sep 2025 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VKklBFju"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441D2E11B5
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794653; cv=none; b=DxFQQ5U91pfviLdUNvIBWWuLp51xoSoxetGyNtJzxuOrShBN29QonuPAwAHK4fZCaiNVtPhMtZB6xsl9Y6HcliU3Ql/cI/uvJvFWS/pnNBrCGOtaR4ge3Czg8cMMRGhcsiqInQEeXyMg6H0LjeL9oDJtjO0Nd3z3duZK7Je0HKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794653; c=relaxed/simple;
	bh=Q6SOpAgFsbSqxChGBgtYqn42FMCU7TsqWdMn2A9wyUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlzYHN/qstfmpsJO6y9QwMwVB8BMKrB0XLJDH0TVR0xJ4ljRjYgxPZtwKG1N23477+ol/rruG1REqSU0N37G9MAJOGThBoHxdGMkrl/poZCCVGwJbgD/Id6S2AfZO0gizbbnNPoNE6YfPVMazTW/1HceJ7N+UFORa/4HxMBpT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VKklBFju; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e98b64d7000so1437251276.3
        for <linux-input@vger.kernel.org>; Mon, 01 Sep 2025 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756794651; x=1757399451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GldbsHOxwOqRszhiKUe3fdsQM11GQH7faWzrEcD84Hs=;
        b=VKklBFjuRZv7qiusTQX74B9FSWxSIKtH1GjtJlgkKCiV/uXyG1GOdF46QCM+w7Nb2X
         eUBt3AL1r6vfG6pcsFUKoWD1HZVKbgqxKJendcDmNopojbAq5cajzIxkFAj3+sN/TLZw
         8kAykyy/pS6vFFD7sEbae6FwM+9+z+xP7Az68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794651; x=1757399451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GldbsHOxwOqRszhiKUe3fdsQM11GQH7faWzrEcD84Hs=;
        b=h/zDJowESBW1iLdS9Y0vha6zaeePHseunyVD6kpOzCpnqxlGIiip0nVNVYd/+eb1xf
         C7GckGhTviw8sUraqkmCIL8eNk1q3opQs4n4QoF85Hk3l5rNIvWdlM8W8b1Bax00tp9v
         CG/99Ax6IFU+YTE09oX0PSEXadPoeCnWm3bSX8ZoZKVAEE5TmJSgIdkCSX72QLvx7FrF
         6EuZo6ntpeh/gpKHJvf+tAKvAE2BWHJNpdY7nPGeqz4mWGYNqCK7lAz67i4y5VpiyVg3
         zpATdT6dC2yCTGnezHgXf4aw0UsFWWBPFL8r0l345esX2y2iOyiNK8rb3TRtW9dPCmr8
         YdAg==
X-Forwarded-Encrypted: i=1; AJvYcCXTFybVDPYntEbEc2yIbM5f1PRHzLS5M4OIju8KvR8Hxni4oy/r2xW7O0ppygb/B6kKxUTu13DvqvD58w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNnFPwqMdg9YAA+RQ9KA4rZ0Q+PqVJlMI5irmqHiJkVwP4TcE
	EY7X6R9IqXuZkmbPCOKggsmboyl3yRfe8jMhoxpAnSCH85JB3BMB2hGpPBI3DWo3RJgXxemIdvS
	OLrAyHlYRgKOxJcq53DFsMdMOnHAQQgUw343NJRdeow==
X-Gm-Gg: ASbGnct8OjmxonKGJgH+jz/3NWYMy7F9ED0XkTs98FK0eWQRpRMM6Inbatd1l+Tuzm0
	/7rQdrekW1UeImn7AUd3RglthC8veTgP4iSgl6k1aJxVmU7PLNiLDQuGvdj3On2/rru1J4sAt70
	Y+jMlqyNkrzDVT7lcmgDzDmRmANean+KAne2TtS+Nu9H+U0hJ2pJ/idweH5e4WVI3alSfxH7eJm
	NwuFA==
X-Google-Smtp-Source: AGHT+IFhB7Yl9/OZwualFBQTMDBb72xbz0Pgu+LMqFnInMFJirNghOMFct+IVEyMhDl89O9Jsjjbl97dtB7oxxL5r+c=
X-Received: by 2002:a05:6902:238a:b0:e98:a36a:7635 with SMTP id
 3f1490d57ef6-e98a578c2admr12602864276.12.1756794651306; Mon, 01 Sep 2025
 23:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com> <20250725230342.GA1993803-robh@kernel.org>
In-Reply-To: <20250725230342.GA1993803-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Sep 2025 08:30:40 +0200
X-Gm-Features: Ac12FXxNBkEwJsqkZcDT2ePkxFGLxfZm9eNi6M7jREEW07RJgdKjrq9oLA6y4Bc
Message-ID: <CABGWkvpeKczJVhDbhyKPDgNyYKYkEaTzJ+xDqCgkuqKJAyCa0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: touchscreen: drop any reference to touchscreen.txt
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, Jul 26, 2025 at 1:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jul 23, 2025 at 09:14:20AM +0200, Dario Binacchi wrote:
> > With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
> > schema") touchscreen.txt is no longer needed. Remove the file and
> > replace every reference to it with the corresponding YAML schema.
>
> The point of what touchscreen.txt says is to not do this. I'd rather see
> time spent on conversions. But you've already done it, so:
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

this patch is Acked-by, but who can take it for merging?
Please let me know the right path forward.

Thanks and regards,
Dario

>
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> >  .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
> >  .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
> >  .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
> >  .../bindings/input/touchscreen/touchscreen.txt         |  1 -
> >  .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
> >  5 files changed, 12 insertions(+), 13 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/touchscreen.txt



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

