Return-Path: <linux-input+bounces-9398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87979A166CD
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 07:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053B81885AFB
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 06:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D5B1494D9;
	Mon, 20 Jan 2025 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEphtcuH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5126289
	for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356044; cv=none; b=P9IDpYlmQabT6Upa4GPUMKnhUa1euC63/sVSmttYULLb0m6j7vmB8wqhsq1XRLmRJupOGGCmboxZ2yyGd+cqTrvoZ4KEs7X5+ZeCIVg2xrveAth6yu1gzXhCyvHrCpGWwPSFvhFEs46nKDEXbaMDUWI/PJMWEMaLiJw9MLR+CnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356044; c=relaxed/simple;
	bh=6NENCv/ze9Shg9krgRjgsC/xp854Pj6T4ZR1HzdgQfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCLyj0YKAM5NWJxn0TQ1972+cXa3MRJIl83KhzzQEZtI/5YJJhZlDX8dSbCfFqQwq3h8FkRPI+b9CKWQ9Wn7Q+81oHBJ3qdpmvYiWV/39LDLOTpwsj4IzCl36GRZ+rL3K1rI4+KBl9XkNt8TpFqFRCKLhVHpbY6HYja/eraGYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEphtcuH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo8387360a12.3
        for <linux-input@vger.kernel.org>; Sun, 19 Jan 2025 22:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737356041; x=1737960841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXH63wvZcF329D+KQ5IRbogu/NhffnrMEBonoEUy/WQ=;
        b=AEphtcuHwso+4y6G7zdeejZKgCWirkPPFDrnga3gjnR5iI86TkG6iN4DGhzvUWCbx1
         3U7LrYp8jggzSdPMUd9WUEu0IymOf5r5ARzENP+aTfeSvbFISrcAwcm7jiPNs1BJHXW7
         FA1aQgYYWptresikqbA7BtjRbWYIGIGgUTzllDAJw9GXu51G0dJA2GBmi2/jH5Gqzja4
         MHmQbIruWl5eb8n5BwHhoXjHqlG8E2ywFdquHtf+pd9rnwQ0mNaEJJ72pfyf3tbzfHi5
         rc8ReSBF3YC+4r7Mv0bk7GsOh9tCGn2+4fQxk1hP4vjhN0fa+JOswBaxpbs5r8HCQ3Kw
         aXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737356041; x=1737960841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXH63wvZcF329D+KQ5IRbogu/NhffnrMEBonoEUy/WQ=;
        b=ciJrsViYHr/e35copMDI18j8z9d8Lgzbn5lme4UAKlT4jdjGdLZl2EYoKZvVl/WwWw
         2FGJ4yb8R8BdCBHlsZjUa0xbaT8VR+thVKY1As0+NujkpgS4cMZf8bdya7gljp61c70V
         ai+KBjI84+VD5jZFf1kxPWLC7X2i6TgDOeJORfj0NYmneuOgSACwcujeRZh8JspHPApM
         4RVjuiPnORvdrqzKccSo4EdphZZmK4Dw+js5zAuxCr19gxz9OWs0KHUgD/Gh8atLc4gj
         BZ0xjgUh2VRfnwH6mdeh03K9A4BD/6gcuzHat0bYv7aawcAzrHkQbknDgzvhaVai5UUe
         0BiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1n/9oQioISHx3rUgud1idvvac2xIxtMA/3hbqWRAyeVoKBLE8UY7oRNaCwRxAOTQNz7oBEYVUaH3IBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2dIk2Bgd9d5BWVJgwUj+GqHGOo0IbksvHGsdPNXuzbhn2A8M
	AsPR5MKmf157qfofzU9n9bE7LFSPXwtYVnTmeluhipAjmmSaSMb80JmFmsUOy0SHt/FOhI2i9HW
	s630p38zAKdWtGlIdeeTU2E/wiy167nmq
X-Gm-Gg: ASbGncslRWeuO8cJW+SBZMj1w7Gf5GkpdqABXYmhTuk6NRgtIadLz32SOCfGexD5ekN
	K6STN6z5EdIAM9d4UsAxMwdSP3xnTg8NQs4ugAnraLWdawNu+TSg=
X-Google-Smtp-Source: AGHT+IFOERuHiaIK5Fkjl4RlDUDq46LbhK6YRAWQMcM+bwY+3XF41CGX7/BPyPXQaLsjF3jIGIIaMuu8UgRS9e2tR3Q=
X-Received: by 2002:a17:907:3e1d:b0:ab3:974:3d45 with SMTP id
 a640c23a62f3a-ab38b0a186cmr1299868966b.1.1737356040402; Sun, 19 Jan 2025
 22:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223190416.52871-1-marex@denx.de> <Z4VsxKJ56jqQnZGr@google.com>
 <952a79a6-a13f-42b5-a311-13321076686e@denx.de> <Z4haguYzh87Bz8hx@google.com>
 <d43894eb-3a63-4da8-9f21-d50ec9b93c6c@denx.de> <CADF57Jdt6PjMyj_DbQtUfDUFAv-P24h_r74-Aq0fEx7S+0R53g@mail.gmail.com>
 <CAH6H9=RjC4V1scV3A7=diixOXKde+Fd81ZhKGehtBGhBYS9pNQ@mail.gmail.com>
In-Reply-To: <CAH6H9=RjC4V1scV3A7=diixOXKde+Fd81ZhKGehtBGhBYS9pNQ@mail.gmail.com>
From: Michael Gong <mksgong@gmail.com>
Date: Sun, 19 Jan 2025 22:53:47 -0800
X-Gm-Features: AbW1kvbqWweu11p3PSgsbXk6oxntWNAtNHCIG69_uej7t1eGJs8A0O3-fLFuTgc
Message-ID: <CAH6H9=T7a9DBKwi43qf7nodqM1Ghh6kY-LJYqvWBDQ6UrTD+0g@mail.gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
To: Nick Dyer <nick@shmanahar.org>
Cc: Marek Vasut <marex@denx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending: Plain text mode:

Some clarifications:the two knobs on the display are configured to be
predefined widget areas/shapes.
In this case, two pushable knob dials with a predefined center area
which acts as a push button.
Current knobs report dents or an absolute position, relative data and
graduations (although graduations are not well defined yet).

Idea was to create two separate input devices (i.e. to associate all
reports to these input devices) as the knobs are separately reporting
wheel type data, although are part of the same touchscreen.

Not clear what ABS_GAS event type is and assumed that REL_HWHEEL was
more of a mouse related event code.

>
> On Thu, Jan 16, 2025 at 1:59=E2=80=AFAM Nick Dyer <nick@shmanahar.org> wr=
ote:
>>
>> On Thu, 16 Jan 2025 at 03:03, Marek Vasut <marex@denx.de> wrote:
>> >
>> > On 1/16/25 2:01 AM, Dmitry Torokhov wrote:
>> > > On Mon, Jan 13, 2025 at 09:08:47PM +0100, Marek Vasut wrote:
>> > >> On 1/13/25 8:43 PM, Dmitry Torokhov wrote:
>> > >>> How about creating separate input devices for these?
>> > >> This is what I had originally, but ... why ?
>> > >>
>> > >> This is a single input device, touchscreen with up to two knobs , s=
o why
>> > >> would it be multiple input devices ?
>> > >
>> > > So as you can see it is hard to express the knobs purpose within a
>> > > single input device. Additionally (as far as I understand) knobs are
>> > > not connected to the touchscreen function but rather rotary encoders
>> > > just happened to be mounted on the touchscreen. They are not conside=
red
>> > > contacts.
>> >
>> >  From the touch controller perspective, they are contacts.
>> >
>> > > Therefore I think it makes sense to report them as 2 separate input
>> > > devices (maybe modeling after how drivers/input/misc/rotary-encoder.=
c
>> > > does things).
>> > Not really, the knobs also act as buttons, so the user might navigate =
a
>> > finger on the touch surface to point to an object, and turn or press t=
he
>> > knob to trigger some action. This is similar to the Dell Canvas 27 kno=
b
>> > already mentioned above, except that one was not glued to the glass, i=
t
>> > was movable.
>>
>> As an observation: atmel_mxt_ts already supports the T15 key array.
>> This turns an area of the matrix into a series of keys, which the
>> driver registers and will report in mxt_proc_t15_messages().
>>
>> I think we see these as being similar to scrollwheels or side buttons
>> on a mouse - they are very associated with the pointing device itself.
>>
>> Nick

