Return-Path: <linux-input+bounces-16086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1CC58A3F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86854363588
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01C613A258;
	Thu, 13 Nov 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPnrSVa9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A0308F36
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048737; cv=none; b=O7mjIQWujpFg/VXmvfd3gK0D0m72cIPJiEZapsfQUSqTn/IC7b1J0YgUeRoYRFqI1/ql7P+SLQVil9Bl+Q7hHCA58PKUJ6OsLQK1tOA8U3pHAie1OiVArMFOvHRtn+TUQeGtAUf9DOsi7KzhLvAyN3iXSnMQuZWN4p+v8CmA0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048737; c=relaxed/simple;
	bh=GwhYoApelHVVE9jUOsAHYc5x6ZTXahYrF0D92jPjL7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5ZCcOVwcBzO9cdTnXIaI2c3z46qfsVX/ZeMXQ7sdpqaMIZrW3GxS+Rh74P6HLmhv2aeyPN0/VQiD7qu4igd0gc8xx/In/rGmtX43O/G6u/bpT57jvflKralVxg9f2K3906l8+HEnMxpbGCclc5JZSQIh964PJrKwzVun7wJb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPnrSVa9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c8632fcbso740382f8f.1
        for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763048734; x=1763653534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjKqZ210vJmo1ohOFjhR6RquaivlDQYg0+nEWmGJGgo=;
        b=lPnrSVa9l6IshACe91D+8Rh+qgYYoMTdAZMn3lVRcwmUowAaSgj+ktFjgcHOPmJ6V7
         csIGp8E+5xViwbd9LWdODJEllbGF9nkfNCg+ZzIHu+UE+/5slaO6xy+PCliYtgS4d0LI
         n4M7i4iwu8dLw2S1znJuwkfUUsib0dLWmUn/qUhjU28OkVyW29f8EFP1BW4anxe3jYtE
         PNcreO/j2jxxHb88r+TMb/PVy++GG4x3/emR8upIh0SeDdFMQ1C4hCzWYIvWNkoYGug8
         XoSsoa2Huj8gv7xoBr8n/I4kwM4OtNdP7Xx2Le0EFcPVocv00/HY0nNewvy7wSuKmqoz
         0PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048734; x=1763653534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjKqZ210vJmo1ohOFjhR6RquaivlDQYg0+nEWmGJGgo=;
        b=g8fAxF0TGeIDd1MsXYbVsUdpsplZAtq74FbEBEj3OoACvCisL6zgNamiehsWi8YGl2
         vNrjdwbd95NWpx76qSt9ou6gayCMR1Mtc+V1T3inVcwW39XzmGUOy1aPkdPk9kNaOW1b
         J0f8xxauR6skjs/66iFle3w/dL383IV14PnfH4kPrXTU9V5DZYca/KRQQPgc0KNSKu/A
         WXu7r3EEc32a+tR/giGszzEIDGDjaG5V0lI+UZ4MIGF0q+iQp6liigXuaVizxGIfhCgl
         tZ2iyhDYrmMRiBt5x0fAOsKPF6TGZLwudcV+PooXjSHQx4vzvzh9D5rSaBWNOydDGd65
         3WQw==
X-Forwarded-Encrypted: i=1; AJvYcCWCjcswX5d6fTdvJpHVz1kwXqrGy9rwGDJugcSnIJebSdA9VWoCt9xnAf/R8938pdOhtilC2sImz6VOew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgCQfDK41XB0Fb6AgSKIdgqmiQfQ9CMASTS9/aoIxHhEi4m8R
	VpMlMYYI8y3utP5sH5t7MRsV8ek3kuh6o3fSd2lFNwTwPS/xenlwCSvwak/9paNIKO63JQ4FhT8
	N8F1rVXMXGkHd2vwUDLiDe1l24aITXO0=
X-Gm-Gg: ASbGncsSfBLkGn3En6uUppZCWvioLtJTu1B/zSbJz+w0JM7QfUxdgfc8TvZNHg6tdaN
	7o1J54vRtmSyEkq2xjSKV01kAudyaNrZw82R9JntdVDNCAwvkeees+zr3JoBktr2fiL0AI181HL
	C+9oAqOWznj9NcNJ+8LNVjSXF06VQFVZC0U7volIUXAJ/mU9ZsRpvPKlOxfDac6stjeAA6+Leig
	ZfJwKhv1KHweOauJ7Teee6xZ2ZdXDNrf6rBoo1/eLtjJx8nlzBBgSoNcmJqti9U20qfFhDZsK45
	5n9I6FLtanK2iwDRL8UaBqTDx8Go7gmz85y820RGra2z0SKDt+ITH5YeMJoor2H+0ywPr7SnsTM
	=
X-Google-Smtp-Source: AGHT+IFyI6x5RJm95yRlsUC+iSGTHktfcGN76wSiyQxdFS2fnEAIOWwjv4+oZtv8N0EO0DATlsveTOJR8O4h83YjDyY=
X-Received: by 2002:a05:6000:40cd:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42b4bdb4884mr5867291f8f.48.1763048734320; Thu, 13 Nov 2025
 07:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com> <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
 <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
In-Reply-To: <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
From: The-Luga <lugathe2@gmail.com>
Date: Thu, 13 Nov 2025 12:45:22 -0300
X-Gm-Features: AWmQ_blIL-znisBibURF-59XWVCNK3O7x4L-ZqBPMnE2bLlz0feBpIaVurcSNiU
Message-ID: <CALvgqEBVQsoQ3wewP+37u5Ms398O5gC8YaELm0UJdZSDBHzPPw@mail.gmail.com>
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, michal.pecio@gmail.com, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You might want to wait a couple of days before sending a v3 so other
> reviewers can get a chance to make comments.

Yes, I shall wait. I was just *too eager*.

> You should include the HID: tag in the subject--
> ...] HID: Apply...
>
> The patch should be sent
>
> To:  the HID subsystem maintainers
> bentiss@kernel.org
> jikos@kernel.org
>
> Cc:  at a minimum
> linux-input@vger.kernel.org
> linux-kernel@vger.kernel.org
>
> plus any of the others already part of this thread.

This is very helpful. Thank you!

I read the documentation, but I was really waiting for comments before
finally sending it, as I didn=E2=80=99t want to create noise with all the
iterations of the patch. I didn=E2=80=99t realize I should wait before maki=
ng
a bigger final change.

> Vendor ID 0x2d99 belongs to Edifier International Limited not Jieli
> Can you change to USB_VENDOR_ID_EDIFIER instead and move to the
> alphabetically correct location?

Could you kindly tell me where this info is?
Searching the internet I only found this website with this info:
https://the-sz.com/products/usbid/index.php?v=3D0x2D99

I just checked the vendor from `lsusb`, and I was hesitant whether to
write Jieli or Edifier.
I also decided to write QR30 instead of Hal0. Should I add a comment
mentioning Jieli as I did with the device?

> One more thing about patch style: The Signed-off-by: line should go
> above the --- line, whereas the revision information goes below it (as
> it is here).  The second --- line isn't needed (but it doesn't hurt).
>
> Look at other patch submissions in the email archives to see more
> examples of the style.
>
> Alan Stern

This is also very helpful. I should have done it in the first place. Thank =
you!

> Thanks for the patch!
> Regards,
> Terry Junge

It's me who is *super thankful*. I learned how to do packet capture,
hexcode/table analysis, and even wrote a script to time out the RGB
lights when idle, show a simple brightness animation (increasing and
decreasing steps before coming back to the default) when changing
volume, and synchronize it with my keyboard. I have more functionality
here than with the vendor software on those supported OS's. All thanks
to everyone who helped me debug and showed me the tools needed to do
this.

And even invited me to write my first patch. I believe this process
should be repetitive, with new people coming and going. I=E2=80=99m gratefu=
l
for the support and patience.

