Return-Path: <linux-input+bounces-13510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C1B03320
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC453A57B9
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056977DA6C;
	Sun, 13 Jul 2025 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCpjedua"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900874A1A;
	Sun, 13 Jul 2025 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752443196; cv=none; b=BwJ4MhJZvoZJQm8fh82Y+y6uhr58h3TsyKErndZw1uLB9/8H0eo0R+Md/X2k07lJ5HnhaOpO8UeMk37YEmdJMe5fVyZhhvU3+CaIEvXQlnQ6UQHZKupzAb84Yj27wMrJwq2hsVt9dljnx0LIN/HiQoz4XZYO6dkgxeUuHJjc+GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752443196; c=relaxed/simple;
	bh=w1E1PAvzaYvklndNODB/pzCGy55FYxOJIyQ/YsQs5mI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hocZXBIsYNxuICFQ1SeM0J9CnNIdaZIFgGRq2zAR0NG/PRncPkrSvdfCj12qH9+du0BOP+Oda+WE96iA3Ov6h27muAWZ3JBtTOVAvcnTtZZ73iw6igsHCZYSj80jMJkjh0nC23OrarOVqMifCjCEkbdOlhP/KjV/vYpWKL9q9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCpjedua; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313756c602fso701407a91.3;
        Sun, 13 Jul 2025 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752443195; x=1753047995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8vi1Brmv8ZeWG21awIXPdsOFadVwkQwbvpnWFtaW+c=;
        b=VCpjeduaY7rL/PH7PZeuljnhbf2P5lLkdHG9XkwffcAw0AAMeMEPBa3ipXjw3u0Z68
         nqCKtU3jww9nOqIBvKovXuGcjMo8r8jDwEpQXS9f03waHmQNkPTEFUy/Of8prEv5VJRX
         wfjtevpCPI4LX852YNSBbsmKG3sB89B9GYpb6GybK+Bubs8/TZxmxohTdUj/3mSqpJAv
         UpgGCBpNTkil3Sf5I4TTOW4DaTUMLiRqz0zBDUxlZL48Xj6cHQ738jlySmKsRQP86oNe
         DJ90mMxj+uFHGBise/7EJumi0w/d0RFg9MPHOrnLpEMmBGoejzKTbQn6eYc5OJJ0na8N
         Njhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752443195; x=1753047995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8vi1Brmv8ZeWG21awIXPdsOFadVwkQwbvpnWFtaW+c=;
        b=TtjbL3UjY8uRwYX3e06XyUaz+qL+rO6myR9u/dwYXJydPxs2+gXlnJ6/gFfE/nzf+l
         U64hmhG/QZ7CapeEXs+JG0Qq93k3PPHwsqZrdG4334NJ8IgON4u6DFQ1LzIVplu3MMx9
         kxzqne8ZOTweF9AJwnUwqOwVezDfzX48NuvWG+aOGligI26h33/6zgdGW/FPneGm7+M4
         fqKeD0FmlHFMBzA8GLLdlDzlbKQMYcRATwirH6wFey3u2wGUrJDDzgCsmVxJFxEPU0zM
         CsfBWkqqiYR/iUtfbw/me6fFn26vQP9HE8d+uwa4K5bUBWfDdBuqD4aHxYGT/0YoWd9j
         14fA==
X-Forwarded-Encrypted: i=1; AJvYcCXLPDIaaVMfB+nAquH7oqfyEgNdnfdGFDePAOG7gZ8zcJTbbgdQyTqrtfqjIjOgCg1XMfwue5QjEzKbqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJB5Wafh8XnFnMFcJMnPfQMx4sKYNSwm9IqRlKiiX5p4HR4nJ
	mV8CZYqvp47lkmOTq8IS2F9QoByYbl3DoLKcXkJb5FDBHGekDCpVZV6TN4mD+ItS2hOKsiUwmBk
	16IgHBLgP+gnpiIIPbkNq2HKAfx3t5Q8=
X-Gm-Gg: ASbGncug2ClzkflNTFE1Rsb1hBNxuJgqm40zO1nxoTbvcl84dBeyThuaHNyFdfWODpW
	QyvZkhOWseAOq7Vogi/bS98ORKY5DaYmab/ZKDCrldbAOY2WUDWpL6EQ14XEdUQmgye+jF3dd2y
	84XsvsEKdbbhguy2C2KO5+0jmi/wQeqHpZmGwq7ZvzCxNe4aEvMWYdnvS/CEjHROag+qyjdOYC9
	XM0SWkX
X-Google-Smtp-Source: AGHT+IEGzRfmNMLPMNpTh7z3DGTruSg+thjLT+AEds3kRvTobS6m9YTuajv4wtaT+gj2ll6JBkI7sYMdec4S25AnU0g=
X-Received: by 2002:a17:90a:e7cd:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-31c4f57d98cmr5909726a91.8.1752443194727; Sun, 13 Jul 2025
 14:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-12-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-12-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Jul 2025 23:46:22 +0200
X-Gm-Features: Ac12FXyw_rQbodajhK-4xzwYl4NImiUf1m0TtMt3w6t6y1plYy906A66i9l9boM
Message-ID: <CANiq72kCRHFs2CjCwNeYtgO=AKAnnqfs8iavmDZ4BJCSrD+=VQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: hid: Glorious Gaming PC Race Model O and O-
 mice reference driver
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, 
	ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2025 at 11:13=E2=80=AFPM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> +L:     rust-for-linux@vger.kernel.org
> +T:     git https://github.com/Rust-for-Linux/linux.git hid-next

Hmm... I think we discussed going through HID, no? Or did something change?

> +         Support for Glorious PC Gaming Race O and O- mice
> +         in Rust

Period at the end.

> +//! Rust reference HID driver for Glorious Model O and O- mice

Period at the end.

> +    /// Glorious Model O and O- specify the const flag in the consumer i=
nput
> +    /// report descriptor, which leads to inputs being ignored. Fix this=
 by
> +    /// patching the descriptor.

If these are the function docs (i.e. `///`), then please write them as
usually we would do, e.g. "Fix ... (new paragraph) ...".

Thanks!

Cheers,
Miguel

