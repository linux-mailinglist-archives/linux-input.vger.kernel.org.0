Return-Path: <linux-input+bounces-13388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D60AF9FB6
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 12:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC8921C44BFE
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 10:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AA21D95A3;
	Sat,  5 Jul 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZb3AA3r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986E2E370A;
	Sat,  5 Jul 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751712079; cv=none; b=d0P+zvhtEpIapQtAH+NRxT1HngZ9SYprQLPEMNydhjes46tZfaJgZ0OAXX647Ho4dN+eYAh6S4sFvrZ1YkHYTVCqxZ6WJQ/gHpyjIjbozBhNQd7/ystYKwzV/QzKbViPXLkdVVXyM8MwPGYsDOaUVUj0bwgvYWdNjwu9jwEuSLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751712079; c=relaxed/simple;
	bh=PJLuvZiqdZkWf6NYgOMBB6vyNYSQXMpLnVk5cWoZMig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNrta0yBPPsnPNFyGSuJgxmFWtCxlHF4diC3rggX7l2UOys8b82Ek7ANYn34qAIagRK8WPGW3NaBcYIs6MV7aZysSsNG4mHbQ7g3AGu/qOOYDMPKboh5CY1jXuaHZMFg8JD7l/00Wj/uwe7nAPQIXmo8+y4TKDSXxvIF8ZHgG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZb3AA3r; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31305ee3281so289504a91.0;
        Sat, 05 Jul 2025 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751712076; x=1752316876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJLuvZiqdZkWf6NYgOMBB6vyNYSQXMpLnVk5cWoZMig=;
        b=LZb3AA3rPHIJ0pMJ7sg+q4CQIAejaWnf8laaueb10I3B/TBlwm7rZTnITbQCe4/s4t
         rxe8i8V31XJDeUAYFJICgdpqKH4pztCyuh82a2Bqqma7MhnFGSPPk7tZFgXaZFUPks/C
         +l37BWMzixhaVAeoT4WUkYGKMjQucF8R1KzjE9yUErh6aRxWA93FWs1rgK72ULG3lTUG
         0nTQzR2YlmE8iFdeNHYREp9yl8QP5WVPS1kl0HjsSt1yLEvPOZIM3+otKMcvpjFOENw1
         GKpJikXMp2fH9bV58YB2eB9ldAcLjIB/ZmVaY288z0CzOjZ/2NZFaevJO35WgJ51r5VG
         MeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751712076; x=1752316876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJLuvZiqdZkWf6NYgOMBB6vyNYSQXMpLnVk5cWoZMig=;
        b=u4l33iZWGcfTo96WbTEhj3Iep1sX66CXiVDThsyLK24j0GSDSA/ytdZtDeGErtiDJe
         nEkhRoGUaxzT/nK9RbJTX6aJ+0+jyii4uBEMwvOv+PYOh5knWv2fgwXoHysKuk3vl9Oi
         Jx/uDZ/R3PqUD2X2JRDRrTDXS8VZIjERopR5Mhh5+D9oI009F/X8MMi9vyYrYuNxhHed
         hU4z1qGi/DL5ef+CMax92rFxdN433mdh+Rt6L5FyFbpo4+nwq36OKCvkIHbKXMM5mJGV
         ScZTWZ36RIblhHFBXMEe5ahcJZaVHXl1cTxwTgAcU5F+FXWL8KflwOSHkpbiFW8ipijZ
         Rz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5wDsiuUFQ8qywoQ42TFG5e1matS93iwN9cLfvvpUKhoVM7MVUELrqW541v3X1TwutWDgfMhNrQIpoag==@vger.kernel.org, AJvYcCV6ewyA1oc87Plle0M+c3tqnks6GTkpApdNCVm8in1Mz6muNvN6YTYxoMQSGSo6zL/hQsYtVnBrDpObKPZ7DfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjnoB9DOC756e2tUrPLWwHLMEKWOi7tfRtYtLFaJCMf+edCiJa
	yhUeMQEOKkFz7+cKhQ0WAeYvPUcVQlaLBqD6+zwMy6engKBOm4I0gqCKV6q6bVug6m2Yn/s3sgp
	mkUXridwqX6w4MNkJRmQVrVY0aJOaIc0=
X-Gm-Gg: ASbGncuVQJ3gAAizr06yQSM64nakFPTVQ5fDkbQTHism5Waoq7JdtZtgxXype5PqWem
	DNKW7ttjpTfYbEMJPiHqQ2X0ZRfojhPB8Fnh4p8bpQYWIkYz4irh7M5E47zyVY+TDCtPt0Gbgrt
	e+91P5ABvlBUetAFNaiFiXCBsa2qFZUZ2/LgWHahb1iKyo
X-Google-Smtp-Source: AGHT+IEu1bQmSYow9+fLfiS1uVddJr0+yTBsjBx/GVXERYZxZlIDYVbR2sn20jR8KVrMxTg4rce+eavY2K7MD9rZDX0=
X-Received: by 2002:a17:90b:17d0:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-31aacbe7a04mr3018415a91.1.1751712075746; Sat, 05 Jul 2025
 03:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-4-sergeantsagara@protonmail.com> <aGD9OIZ_xE6h3199@pollux>
 <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet> <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4>
 <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org> <87frfbksam.fsf@protonmail.com>
In-Reply-To: <87frfbksam.fsf@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Jul 2025 12:41:02 +0200
X-Gm-Features: Ac12FXxJlxNsH4F8eMeviqhHbBXvq3zUZ0Rz8Zjm4ksdaZp5XWxcTacWtRhTpfU
Message-ID: <CANiq72=+UUFVemSGHvzkX5FoOv-U5YRDKQkbKjYwqEfex-ey6w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Brooks <db48x@db48x.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 5, 2025 at 9:31=E2=80=AFAM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> From what I can tell,

I think Benjamin wants to keep an eye on things but may not have much
time to take care of patches and so on.

So it sounds like having a separate `MAINTAINERS` subentry under them
is best, with you applying patches and then sending PRs to them.

That way, they remain in control, they can coordinate any changes that
involve both the C and the Rust side if any, and so on; while they
don't need to handle directly Rust patches themselves, fixing issues
with the Rust side, etc., thus removing work from their side; i.e. you
would be doing that since you want to drive and use those Rust
abstractions.

That arrangement is great and what other subsystems have done (most of
the entries with "... [RUST]"). It also helps more people
involved/trained in the overall subsystem too (should they want more
reviewers/maintainers), and also allows you to become a maintainer
yourself, learning to send PRs, etc. (which you may welcome -- if you
already took patches, sent PRs etc., then please excuse me! I only did
a quick search so I may have missed it.)

We try to reserve the global Rust tree fallback for cases where there
is really no other way, e.g. when a key subsystem doesn't want
anything to do with Rust at all and thus would block many others
otherwise.

Thanks!

Cheers,
Miguel

