Return-Path: <linux-input+bounces-14687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F2B5641F
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D54517B586
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9102E1DC988;
	Sun, 14 Sep 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX9DDF9B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC391D79BE
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811803; cv=none; b=MKf8DeWnFqLt23BfjU1VLvyke2eDa5LUSnOG3kpyhYe8gQ8GgLT/0VccaZWQHxVwRTN+NgzBlpYIyxeatLae2dZ4WCmHVB73UqcxiPHH6lt7ooU5k//dLj5Lp1lYAFqfSZEz+4oZ10mYKI6lPu2PGjyAJTeAO8SX0IrGiXLijgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811803; c=relaxed/simple;
	bh=+9K+/N5C7IlS+WITWDJ3HV0SDwHHeeqn4hn1ZxnOHWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyFRVTY5iC9DQoov0tewTvY834VYLoU+iiRmBc064T0h80hBOM7WtjHm3/dX2rxPnZPY7e+IcUHk8ZfkDmoroCDAEQPayvwQBPFmrwNmLBNikDQkfBGNC+bYwcyycUscAhhDF0cP5atPgyasV+SIRjEj6rU7ThMWLnhlU51t76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX9DDF9B; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445824dc27so26556845ad.3
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811800; x=1758416600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLYD3TrJnWWZ1Mr9VGKhucjc/Qr0LcMf32NCeLETcbE=;
        b=UX9DDF9B9bcdO56T4FuROtNHOVlFTEHVyjX53Vun94RC+NrjUauKPQLJ66ppA6kFFu
         yMr77nP2Ur9ntia8orUl2B0qgBb3X2gMfSAM62UZuQJt5KPbcStS0pYXh7DryL0i1rRe
         BlUrikm4JSLhO19hdaGivlMQAN+cmtJqgXKugIAyJ39NjEj8VF5vW0O4bKalXWP5bzpk
         siYekAot2WVv/ruouLs0CTYN3XQdzECCu+XnG5He9XHD7Buq7oC0ZeVvyisGVZm6I6W5
         mRYNaZt12i1IDgcitt75qsAw//QW1izMfvwE8l8tVIqpuX/QwPNZNfbOcCXFZKRCUyAv
         VzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811800; x=1758416600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLYD3TrJnWWZ1Mr9VGKhucjc/Qr0LcMf32NCeLETcbE=;
        b=sZBuzEJ2Co6Wl663apgS3LA9p6LgSce3zLPfKgb06j3k2eqoHboHs1ecajV19aYOLA
         YEQ+t/GRLeYlp9mdr35h+7n4ejCyTU+fkPzfWOGEUOCiUb0WOnXTwMG1W5KbZBtb/POG
         Hb4ZmNyfq4EhsoTtDhLb8Y84Sj2isu8Uork0Xl7Cv0st6IcyoQnhA0Ys+DewVOewGtC1
         lNyj6oimBOfFC53xY4SBRz7xznSxo39UfzCFYuzrwAGroslEk5dRSlcDh00mQVfwuV6J
         9MFYKfEb9kYwcEfSm/XY5wzl3wDJXmca5Vc8NQqv8C5/wEFpn+U5A+Lx7v9AJaxyAAuz
         w8nw==
X-Forwarded-Encrypted: i=1; AJvYcCUvY0K8PSb2Wro4QxWp5lMoe7/Z7X9kMXfusEQdNJOKg9kEeP8BRAcf1VYREgzE4xcTExJIYrOeryUVgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIgsLbE4/W+9IJGcSAnN8TdRP/K5taR9qI7HwcCBZVRtszwGh6
	jqhMP+dfVkUarnDMWepByg7b7HyljbHh6jd605+GHNhObiGSCXJSdfgA
X-Gm-Gg: ASbGncs5cnANiNylSPIZnva18fOqbD94Vh9GihJuDovGbWzbWLA51CjKTlYVJ6pYWuP
	hyjwsnysl0e18hcr+5PdVgv5RagCq4jWZX1JkS8XKp/mdTHlfIaKEvtBXDBMZo3HHo32g2i4/RS
	z+Kl3vy7ZUQE42GRRZoW9W31486xd3311HB6Jgm0YoNyK2zhsYbex4TBFS4LZQ88S/JC6+amCjt
	+vNVec/8pMH0vS1dJgpXrYDVq21nj+V6LUMs+EzYxyPi5IH8Gi/61Kl6nrI1JP+pI3xzunyD4V5
	KVYyCA/PCa7lGVygPz1xLd6DqBB2w4nQNcpTahnSLh+2ErLcXwIpm5zx3vXs1D1VLcLSaRhMxcD
	ZOipmiqhyCRXuRvcZil8Leq/v+UyHV5fK
X-Google-Smtp-Source: AGHT+IHef74nom+ELoom0lADVTCoVjWhPLP1BEyC3csZHK36zDpwc7vILMBEnxkgb1pVFxMxGbrb8w==
X-Received: by 2002:a17:902:ce89:b0:25c:5747:4491 with SMTP id d9443c01a7336-25d26c4ab81mr99312055ad.46.1757811800323;
        Sat, 13 Sep 2025 18:03:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2609445f906sm33275305ad.65.2025.09.13.18.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:03:19 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:03:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Message-ID: <h43gwyrhmyftfzhyylexxujt2w6roa6dcvd3flei2owstk5f7k@qaix7m36aahu>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:44PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

