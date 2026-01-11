Return-Path: <linux-input+bounces-16947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC0D0F8ED
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 19:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56DFA305339F
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 18:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48CC346AF5;
	Sun, 11 Jan 2026 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwfFkAzx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836B1F03D2
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768155670; cv=none; b=VkZMsaduYakv0/UAIUkTIZaiosVsym+lwXU+heVxlY+AK+n+vpQWc/QpSJ48BqfpSiXLJGGta7gzYJmEgILn53wkG10esIKjw8UmNAmriklOAxTu2TC3wqGRxEfSMZFn0P9hmDUa9ZrvYM7iV/dLwDkSPc2Tl3UNupJ71HKfU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768155670; c=relaxed/simple;
	bh=26XSF8abaacHWOSeK0Gpp40CHuhyJtv5EuYNp6TvHIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txcR96z7WYzcmpKK3NhmJCsjGGa0SLE2WrFCt5edVqQSa8Y++9noS4v7ohjtQckkUh7RQaFt+6aXC1DYYPW5EmA3Vyx6CxKZdph/zO7g6SOncDs7jGUEIIMv/w0gNTa6BBJP+inBh0BmYrG9TAc6MJCOAOeOvXb5DwaYsw3jPm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwfFkAzx; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2d32b9777so858119685a.2
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768155668; x=1768760468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
        b=QwfFkAzxZW9dzaFI8xq/KBMAu76sookzUEkVXk628ft7TY+MjtYgwDejlHevl8f/ao
         Ic70YiCARrIvAtef1dBnkDRBrGylHX+8jTtVqaZlrfDbiOFR8GfqBoJB9UwHR3yN787s
         Q7ZwEv4bP3LT6FYGOhrtvtpRbzmYoAz5ehRrYzykC3gvMgvB0pglKeA9uYNQyWNsqZO5
         D/CZUkwmu7yKLrMcgJYQ+Nuxh9TAP1FyrNmIIC6ZJ+0eGliHJzi+ueUGVjD043mZKki+
         8Kl/lSSbLpX3xzQobIPz979+1urBk8hAjYZKvJDenEo8V42imXRNPkIeOeMsL46sVuUV
         4ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768155668; x=1768760468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
        b=XIhDRCT5bZYJwwj+g03nYAiua6S9VE3TcRNHYCGa2tdAp0M7DxVOaL3zSQTF4S+jk2
         q7s6zzLt35GkUCmidOh9MVRzHygARCmunl88CMPiN56bxK30eciR0e9IqmdGQZdo78kX
         mj17ElYUDbaz/aIBoS2DyReP7cMa+mJvJhhIo0KFv09ZfPT+wWD1GYHuxjvfds1MnRrJ
         EMchR1WH78NSeK4reLNW9v1Bzlj+qzQkuPe1nSthK45tnxWXBdGxWwpadA6kJTiyZceS
         aPh+1tgO6HuDFaJ/jiYootG/G3Df2Ttea5uQvTZ6z1u6bcu2TDcD7WOQnTmQ9urITHiV
         jEPg==
X-Forwarded-Encrypted: i=1; AJvYcCVfjHvLuxzw879cB9N9H79nfCelL9eb6QxzkjW7xJnUbMzSjm8/T4TPH6aKNC3nir9fNqD+m+4GGkmyKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy902jVuYQUuJdNY560Y0YImf/S+GpoWnkMgJBLrz8GQbYlk1LI
	afIXuU2Xq6VXd5ptlvbCtmYcoB+5uhlPKyz1R9TtPe7cKy+dQe0gB/kMPujpIg==
X-Gm-Gg: AY/fxX72TaE9xzojaXbKCwmn1lONuensYyPsPYOlL531bBVujzXA5efPj8yov2pNRVj
	0LIru0odi0DPlP9kK9y/+due4SmDqXB63rJD9hxUonb8oGNOxQIlZsecPsZuoeZmv+GyM7Atra5
	s0Df9q24t0QMlozxMmou5wVp21pMYyyyaTxzWRf+riGhgET3jqRbsYysLC/waBI9XIXHmUrmbJ4
	JB4LJJsu4eAOMQYlATLKa/iuuS3FRiFbOmoZI0fPzm+mxJITUZTrTuknSQS7pwWZq1Keg5z3gTq
	laWodWlwqJUOWbjZSovyzsv1CPdiEOcHAT1dAlmP5PAAUTZcsyarHl6xQDkdsqPIJEYW1jKqNd7
	kFNSGOyl6nhSqojsPuVrJQabZfEMqw3RpwrTkDl5tn5EtwfhMmCCe2g00jSOXveDO6hcQsCFn0W
	Bt/4wrqDocTcqCJ45Oh/iN+GjVwZxUpVd+UILJzEFL8FmkbcENm3rg+YWIjJO8710Wivhs
X-Google-Smtp-Source: AGHT+IFr0AfQqdzuLfF2we3Zx/EJP2hZFx2oG+SaK1KaO8OqQ9sYp0F8cg/P9dtkorxfQtRFUlfUMw==
X-Received: by 2002:a17:90b:28cc:b0:33b:8ac4:1ac4 with SMTP id 98e67ed59e1d1-34f68d3b273mr14688746a91.35.1768150214300;
        Sun, 11 Jan 2026 08:50:14 -0800 (PST)
Received: from google.com (61-230-24-179.dynamic-ip.hinet.net. [61.230.24.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm15175971a91.3.2026.01.11.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:50:13 -0800 (PST)
Date: Mon, 12 Jan 2026 00:50:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <aWPUwCbFoIItG7n3@google.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
 <20260108080836.3777829-4-visitorckw@gmail.com>
 <20260109-remarkable-crane-of-exercise-6bc17f@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-remarkable-crane-of-exercise-6bc17f@quoll>

Hi Krzysztof,

On Fri, Jan 09, 2026 at 09:23:33AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 08:08:33AM +0000, Kuan-Wei Chiu wrote:
> > +
> > +examples:
> > +  - |
> > +    keypad@9040000 {
> > +        compatible = "google,goldfish-events-keypad";
> > +        reg = <0x9040000 0x1000>;
> > +        interrupts = <0x5>;
> 
> Same comment as before. It applies everywhere, btw.

Oops, I actually had a local fixup for this but forgot to apply it
before sending. Sorry about that.

On a side note, none of your replies regarding v2 appeared in my inbox
or spam folder. I had to retrieve this message content from the lore
web interface to reply. However, your replies to v1 arrived without any
issues.

The only difference I noticed is the sender address:
v1 came from <krzk@kernel.org>,
while v2 came from <krzysztof.kozlowski@oss.qualcomm.com>.
I suspect gmail might be silently dropping the latter due to some check?

I'm not familiar with the email protocols, but perhaps it really is time
for me to start looking for a gmail alternative... even though I see many
entries in MAINTAINERS still using gmail.com addresses.

Regards,
Kuan-Wei

