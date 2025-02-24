Return-Path: <linux-input+bounces-10257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB0A413B2
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 03:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8F53B41BA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 02:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FF01624EB;
	Mon, 24 Feb 2025 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx7MwzUr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8B4430
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740365494; cv=none; b=KM5EY584g+ug3f38FfsIhe5J8IGnuV/plR8CqZFzz+VG5KQiWZIH7CGWoMixpO8MQFRaPNkbRjpFkaXTL025ydNfr2froNzDQsnJb3UyB8M7TK/EQmW8AW9DW8/VoKpm9f1uoQGgkUW8p4VhCaCbIjDm/J2aDEiyo0yxuDeN7wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740365494; c=relaxed/simple;
	bh=1bRTm+m0tarFqUibHJjzAvHINsi4qTPZR3KrISJX3OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2xPjKQvjlNn+TGAEyf2zgl57RAxNM9K7QEBpGKJODTUVx0SPa19BfLpUbg+7t8+fuMfHKia89Qt3ZMRvfm17cwNoamp5cVsEIvEAFSWD5xvMkfqOe4pCkUl6Wkt0Fpm21+zeQTxe699pLk7agKAtDQi87kJz6lUq2xeLYAd460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx7MwzUr; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f4434b5305so31596507b3.3
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 18:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740365492; x=1740970292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bRTm+m0tarFqUibHJjzAvHINsi4qTPZR3KrISJX3OQ=;
        b=bx7MwzUr3jBNesSkzLH2L9lJqZMprB2wWcM9QkMX+tplj0xDP/ZaPQivDT1ykA1ZuO
         ZEbNsBdcqKleK1hnTA2nLcO+Rr/ddSv8bmKx9UxTjk5b/92hF6DQMkHWUIZHMY+guhZN
         lp15NTH0p7QeTpfG4WWHslMwLrIJEzouTBGZ41DSVq1lbbWFK7fTVRVo/RhTOILNSiuF
         PTLhjcd0SK3tCwyJqt+oPjJR5ufJEYRblSHZcHpqNBEooEloXfe6SW25XF4vI5PrZ4Mn
         X6645JZbROmp3zL3cLrlBko75DirpF0xIwnSP9PgqOD6OTgfnNCSCicAoKTevspU4V1m
         mzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740365492; x=1740970292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bRTm+m0tarFqUibHJjzAvHINsi4qTPZR3KrISJX3OQ=;
        b=TtliN3d8FewAoROGQtneV4Dm4k3UqFRjF5DAlAipY9IgLUe81rrINfiXAUSffeCEiz
         ylYUvkZJssDtDlaQAjTFwDoTmb5kIAGrsrdh7sG1VXUAscEOqi21k8HYtyNJvRUtW3wT
         sQi2AiZRL6wW1MsxGM+Yx0OzRKQq0kEPbGvvIaOtq1MiB9mjtUkIiMox5c7xV1xSjujK
         NG6+0fBVGcwrdUTwxCr2nbJwmkniU5jFAAQN595SaMrQTjt8xPlA3X6vi+tnRXPzxC3S
         nbo+QiWOcsTVxsnhh3tup9lIkfWJV5esSC30fBevCMZeNVUzdM8Tjcrgl/zOAJPKmx93
         wEJQ==
X-Gm-Message-State: AOJu0YyusIbsc8cZmVwI7T5JXKBZJRCflsCKCk/lIFhHygoY7b0yKNGV
	wwFvMaCNBkvKygxor5v19pJKa8YFu9V2C8fK7AbfLRje4HgJJkSIcv9pF+K3Zaxr10jXdpEThSo
	6F6e/AhNtTzfXQxudobg4qVj0mI8=
X-Gm-Gg: ASbGncvhwamHAejNzF80+JSLNQ6+DUzL3p1q+m+UUg+nmIsOuesxVYPj9CcskgP8Q13
	rYMoLlJDM09H+o4LXF6IvupcixnRzQa/U/3ioos3gs21/ReOYwvJ+oip/BZDj5LlC8LMROy0hqq
	WpMMKPd/pqe5LT/0djKnydF2b+scVSwaOZEg7h0wDs
X-Google-Smtp-Source: AGHT+IF9KTMhOi7i3P9OdnC3Mb4jLeY7+84GnPWhHdoo07WCuvISScJt9rYlstBEoCbBQe0MV0qvN/kLmt4hFUdrdN0=
X-Received: by 2002:a05:690c:4c03:b0:6ef:4a1f:36aa with SMTP id
 00721157ae682-6fbcc280606mr95690377b3.20.1740365491915; Sun, 23 Feb 2025
 18:51:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com> <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com> <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com> <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
 <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com>
In-Reply-To: <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 19:50:56 -0700
X-Gm-Features: AWEUYZnhJVOEbL-8X9iZOvx5oJZXOfxoJo9o7fD_8Bg1UeSlscVW7oL-SgQQTZI
Message-ID: <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, jkosina@suse.cz, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 3:02=E2=80=AFAM Aditya Garg <gargaditya08@live.com>=
 wrote:

> Can you to test the patch at the bottom of this message?

I tried it and the patch works. However, I don't think it is the right appr=
oach.

> Then see if Fn+F6 switches the media to function keys or not, and media k=
eys work by default or not.

The main problem I have with this idea is that there is nothing to
indicate to the user that Fn+F6 switches between Fn modes. If the user
presses Fn+F6 trying to actually type F6, they will be very confused.

What all of this discussion tells me is that it's not possible to make
the Omoton KB066 work perfectly, and it's not worth our time to try.
I'm not even convinced anymore that my original patch was a good idea.
Since we know now that we can detect the Omoton reliably enough based
on its name and its PID, I suggest that we simply add "Bluetooth
Keyboard" to the non_apple_keyboards table, with a new flag to
indicate that the name must match exactly and a new field to indicate
that the PID must be 022c. Being in the table will effectively disable
the counterproductive Fn key handling because fnmode=3D2 is equivalent
to fnmode=3D0 on the Omoton.

I will send a new patch.

-Alex

