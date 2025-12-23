Return-Path: <linux-input+bounces-16677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B5CD9D45
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 16:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2357931A0474
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BDF34EF11;
	Tue, 23 Dec 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XHzjdBPA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807B34EEF7
	for <linux-input@vger.kernel.org>; Tue, 23 Dec 2025 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503772; cv=none; b=pqkUaGQbK4g25BFv9NUHV8au7PA4pBYrpnckvJlGgZ+SJBaxjLCw3MxrsCHrfiI48jTAGcgR6HD105L58uGGT4StB/Z9LZatxgm1sjqNVxkhggcRLCbS03VMzVQoxyOe8fYly1C+gtZzqhqilbWHDfhMJijVOaxIx9FUoivlxC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503772; c=relaxed/simple;
	bh=J3Ux6KfmhKmVgyLO5VYVS8zBuR2bX/I0/MfIw/LAZ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwDjSuL9rGFpWxWrLJO4XLm8WRaccaTMV/nzzKrmuq5OobtiE5eCj/S+0d+a2/4AqnFvQIhdpZyqH/krNxja8y6BNghL5Jhe776xwwsRsZpP5p3J51VPTkjYH90mqmdvly0rVPC6EC/PdUeknQjlpaLFAzuOcBmBvDnVmaephKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XHzjdBPA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso21349645e9.2
        for <linux-input@vger.kernel.org>; Tue, 23 Dec 2025 07:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766503769; x=1767108569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KU2jR3iD71XyPNeJB6Z0f1sjv8gA+ESxHLWTu3Zqx2A=;
        b=XHzjdBPAWHVtay7+fsIvV9El1nPIYt6h7ExR911FDpPPg9P69fGY1H/D4IxdIKuc3W
         lovEzRkWlZytAFntNwuznNtjvDYTwktw50Nd/R8GhebMI3rIvUqX1YCUtHi3SHnevNIp
         vFa5FSj97qkFhN+E4jH534uy8AVU1H2Hh3cTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503769; x=1767108569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU2jR3iD71XyPNeJB6Z0f1sjv8gA+ESxHLWTu3Zqx2A=;
        b=G39Gx3zpRcAz3cfokRBU2M96q7bZZsiHIRne/8EhbxLPjmcEdRAVPFmmdjk8WTOBWA
         eHjJZfDIvsnByhN2bjyHJdCzmf0cRB3Z8Dl5slAPm0PVa6bz7pL0mhd3WLrpC1lnbTKa
         Pjzy22Bvc2MS/a5PUbTKZy7tPFNkTzcFGRrNosEp6cIGhpRLuGHTvp0DQG5/Uw5+8RbB
         9MoIJ0/w9+qE5hCKZxjw0lAT6TN7P+V2t3zjaL1EZRheIYi1jllhHMRsR7Bn8A4NpXMX
         NDy3eqCm5D/fDS+BTughWGn6v4KX/xs5MHEJjDKBNZ6vE/NI5TeeYTz1qb2lWgaSvTPT
         De/w==
X-Forwarded-Encrypted: i=1; AJvYcCU6fIvkO4ImfIHFZMia0QGrpPyWxQMh44Ek+tfbZ9UUVYzz6InRneyOSixoVDHcsaNVcQw/vqVzRLVL3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBEL4k9hdEOuucxak8cunP0s5fW0X/EK5nLeem8R87tzhGVMO
	KHnXUo4RE8FwU1Ro/V86YTth/FYGwpkHQ1RJDHlTX+CjCLyUREqCWJAA3OibSammnQ==
X-Gm-Gg: AY/fxX5J6olvv8DIWtEext2I+4AS8xjx45YM+o/luxZ7EJXtcemhg8807H0tWyXo8Lw
	sp7N6p4pDge09WHcaSh0bKzw6H0cDE2+D8fK9G9olFfgQDjVdp7+zlq7S9ctQGQCZFIaJQ8S7Y3
	twkFlWaDiULtA2CKGM6LeZKGYosOmmXLef/wCvpWWl03/PPYbZ8fI9Z9wAvOwPpqjUDwW1BKvP0
	7amY2m0OeTBnTSXTjhTVU6X1gBbRQn2SstLjV+xPtOVL2gydSkb+u7RghWy70mNnAjF2V+pqqgW
	3MOJ+p7vISluC3oXR0R6RmryMRLZDq2gzHcsYTADjrfcELvhYQRSGVh7YjcZ0nY9oo2KdTD23jq
	vHD87Sei6EZhB9w1r9XbbOZ2Oh6tqTTOSJyJQtOKIXK9Qu1STgXvrrnK1kvb08h5PYo3Wp6Y7V+
	BpCf0nZiPxGXMYBxHTig==
X-Google-Smtp-Source: AGHT+IG/0CMavtTslZpbI5j2xnemhkhT+LYz90KZrJXqfzvE0jdXgerJdltJj03OeHUtFpEK624zOg==
X-Received: by 2002:a05:600c:4506:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47d1957711fmr143504525e9.18.1766503765317;
        Tue, 23 Dec 2025 07:29:25 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbc0bsm248425045e9.11.2025.12.23.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:29:24 -0800 (PST)
Date: Tue, 23 Dec 2025 15:29:22 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aUq1UuFHE9B9zHIz@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
 <aUFPKni-iFkxQQGu@google.com>
 <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>

On Wed, Dec 17, 2025 at 10:05:45AM -0800, Dmitry Torokhov wrote:
> > Had a look at the tegra-kbc driver as you suggested, first thing it
> > seems like the fn-key functionality there is dead code since 2013,
> > `use_fn_map` could only be enabled with platform data, not OF, and that
> > has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
> > be false. I could send a patch to rip off that code if you want me to,
> > clearly it hasn't been used in a while (unless I'm missing something).
> 
> I guess you are right, we shoudl clean that up. We have another newer
> driver that uses the same approach:
> 
> drivers/input/keyboard/pinephone-keyboard.c

Alright I'll look into it and rework a v2 with the extended map, checked
the code again and I see your arguments, sounds reasonable.

Cheers,
Fabio

-- 
Fabio Baltieri

