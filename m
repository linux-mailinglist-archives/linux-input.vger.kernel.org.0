Return-Path: <linux-input+bounces-10843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96321A613D9
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 15:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67A9A7AF88D
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 14:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320E200BAA;
	Fri, 14 Mar 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="focrrJ/L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609951FF7C1;
	Fri, 14 Mar 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963277; cv=none; b=JytuKnQQAsn1vf3HiNJVknDVp/69Few2j8hOhaNYPM4lMjIpbHXfcOq+vyeOBpwHvqQ91JurUPtpqB77XWER5uD4m6mbBVUv4zwRT8OAGMt0990Gst88GePITSMn2R+Z5Jq3vnXCuoFRsqpKJ59EeXUZUH+yc2ETeL9HrkCpO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963277; c=relaxed/simple;
	bh=OaPhMnnfACM75+eLsSzYFjdr6cOogzSh4Qh4Y0CvTCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqkYjNMBaTMgQaH6Flr1e0RmQ5CX6IM3u1l0klbZFTufehIIMpw/BFcr/JlGPKBQjmJh7mwoSCLOxG7/xdnNvEX2so+ntWcnfjtHn5cpMh4MndohyjjI6SkaB+4SFNmGtehR+dvOHtnhid81JVPZ46QDsoTCpKOx187q4O2wgXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=focrrJ/L; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so467732a91.2;
        Fri, 14 Mar 2025 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741963275; x=1742568075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaPhMnnfACM75+eLsSzYFjdr6cOogzSh4Qh4Y0CvTCk=;
        b=focrrJ/LDPXwN03BZ4KZnKuqr5/e7qzb+JAjgAx2TPgZN6g5WupD6DrduVWLL7zpIb
         KCAxrwpfWjacLilUTuwpKi4VIiJgwYqX1y/UQ43ds6rXhdj2eABhw5BQFpPSmqVLg1WR
         pxuVeizcqj6NyRJvUUOM2AN7fsxnKY8Xa0kw0PE0ge1TIoA+4VIhjYzKUMBixBHMG9nJ
         ILelF7yjvitIfLAPvGoa5c0f6YNMH91dTyeIk5TbBD7+/W4n5DkbsoeSyIPOE7aUiEBZ
         l2iX9go2BebI5v/owOXc+llShJCAlHH5BrIz1jJ0ZBTqyrb3xEKKsek+ITiSnrpxZCOG
         x53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963275; x=1742568075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaPhMnnfACM75+eLsSzYFjdr6cOogzSh4Qh4Y0CvTCk=;
        b=DYnTQfuKntnk9MAlB2xPSYxvqUQDRHYFkfKZoVYwntnzWmSJFy35LyIE/RpqiCA9M9
         KwyNedKDKodnJ3ixT1icpFXmsRX/gG/kHJb30E4/ZsIy/K46Kansw7veWKGQEqvAOQCk
         y+8SHycdINbfGJs+HMKZdfgzs2LkbcaKk3KhqFOjQw66UOIZhrHgowowxo0bHrP9v02E
         4j8/eb2R4g7VbStpJXfkEyDB5WnoDwTKOtT+BxIFDiY82wcsAX/qvkY5e6UzP+mqLQBr
         e7ikUPcLTQoasaZpvbytV/vhd0uEZo+K9Chky8U02narGppuXdbUFrxGVKdFyQWMgFvp
         EhiA==
X-Forwarded-Encrypted: i=1; AJvYcCULgSyjiQOsg8iVziJZvCVO8np2FeYvA1eIGObV93DaK56EWiP5iCWDqtXu5pKDpyKc3UFgkKSb+t5uBRe8z+s=@vger.kernel.org, AJvYcCVpe/qXchHvYdBRdNxcslEHpCFMyt4ENZN5+pStpQCqNfegi1RCdZx9/GEAiTNcSCbzg61uE8OFqWoBdw==@vger.kernel.org, AJvYcCX7PPnJJO0sETA4+5NfK6BAM+7upUayqlG21TzrLNJ4/FxyL1xiB4ntYHxyrOqyUMjWCVRfJ5gobcZNT90t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5xIINCpk7ckPZjRaAImd9QQ4m17R9wMZCldyAwGspgnSOSjl
	g2XEqOlRcYxoTbuUJL0pjGMeprfHtYn7HtZAzTu/9vF5evxXLCEJCUm8Djc2Gjp/ijW4oVs0a+O
	dTkmru2nHl5x/knFAdCOrRB2VWrk=
X-Gm-Gg: ASbGncs3Zwn8vsYVcBstlbebIoLN+GBz7jMYEOL29QdZT/P+5iRLTvwT3jqrB+0/Gpa
	Y4+oZunPfEViVZHMW/db6zJFeXbraYINTob4czonqR1bcDduzFgKBqqdpqdW0vWraZENTHjGuDr
	Z1gpFPGBPfkk3sj6hixdcPuvx5Gz+/f1zmP4pN
X-Google-Smtp-Source: AGHT+IEjFDMwRMyv/uLJXjTayuOgzA+DKylGhNzsz8bhe0w39EO/liFW6CLnkGmTy9zaRFOk71HcxmEXAJIRYYfFX38=
X-Received: by 2002:a17:90b:1c0e:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-30151acb45amr1502585a91.0.1741963275539; Fri, 14 Mar 2025
 07:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-5-sergeantsagara@protonmail.com> <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
In-Reply-To: <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Mar 2025 15:41:02 +0100
X-Gm-Features: AQ5f1Jo4E3at7_v_DatqGIgW2sz-ymfWGTuGgFNOqAUl5-ewt2Oo0ufesnQVSJc
Message-ID: <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Julius Zint <julius@zint.sh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 5:58=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> skeletons are good for documentation, but not really for code review as
> they can not compile.
>
> You should make this patch part of a documentation in
> Documentation/hid/, and squash it with the next one (having a minimal
> full driver instead of skeleton+fill in the voids).

It could be part of the documentation of the `module_hid_driver!` for
instance, like we have done for other of those macros.

(In general, we try to use `Documentation/` for things that do not fit
as documentation for any of the code "items".)

Cheers,
Miguel

