Return-Path: <linux-input+bounces-4688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A461591B310
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 01:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75C71C21156
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 23:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541831A38D9;
	Thu, 27 Jun 2024 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+ohMYNG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA8B1A2FDC;
	Thu, 27 Jun 2024 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532729; cv=none; b=C7r8Ar1UVwVM8WVqa7tLcHzqotzm2LoixKC3X85EhrhgiW5OFnPCd5DvdwryCik4dsMGQhL+LaIk8oyEfwI5jwB3yB0ESVjLwqyRUs2iJQANyf2Hx6BgnEzil3t0woyMRhBpdGiFzJaet5LKTSOCWlEwQykhI7EQRrCU7Q83p7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532729; c=relaxed/simple;
	bh=v65OtUCDBmq2UINiXyuxk40IqkzNuvUQPqxvy5lE0WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fk3vMkpoC/JPkauQx8zxE51kbBjIza1Sv0tAO+oGa9jtrcfWOc2OeiUX5dVMpdJkLVjMI7TZbmbTJensiKE4j9dLRWZQEr5i6THOKJq8JF71yOWPq4/k3mNfl5uZapmjlKwlj3cLmqABPOtd6FOOJcfyugUdJMn9Mv+v+299K6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+ohMYNG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-726d9b3bcf8so12119a12.0;
        Thu, 27 Jun 2024 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719532727; x=1720137527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NgDBoXjux0uTdi2Gv8P11eaLmeWdzLWKwn2+FzWWXtY=;
        b=d+ohMYNGvMiw6P919YL3jJQXIdCgIK2hPYNpD6HNJ61wBLltv2f3wARagVPofLK0eK
         /LSxTD89TnIj+8A3qmdUdR7qUKtvuv1KtOZuA36ldFsegUo1k7HDikgJLNQ+/UEcTMLK
         sM8gRGbQGTHfqjQARzOPnpVpB7sfs/jlPooDafnadvidey1CrEvlij7llTwb6C5D4bG+
         aK3mJoUVgaFGLmR8lCIIl++sNme300z+2t8nh7Be+hKEnmVxQw1ME6n8IflZr5NiIC/Y
         QMs+oO6R2GZxpylg4HvwN3oJhQWA0sQ6FuE4Pi6rszyHWGZdCMoSQRLy6ChmyGU0uK28
         g1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532727; x=1720137527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgDBoXjux0uTdi2Gv8P11eaLmeWdzLWKwn2+FzWWXtY=;
        b=pOkqH22iMQmOPf8ZPonrSbqpktjcmrj4QyaArweajmZynPwWEc/HUFpfwwdSya3F3I
         2Li5ElbC8gQqFvfH8N3bq/zNE6lcluJQbwVPHQTE0dox9wbXzveCZi/EDdr/ICSrbFvi
         qF7kvNy3gzQaPhZ+klucu95pw2bsLZB0CFSQa+yQrCs+7CzCCdD4VroMup5QuuGc5+q1
         ueYYdk4jwECPEdGXY6Rd8jn+eSy/GdImKay8DRQWTIxW/kB2v+lkKI0BDql/FwA5N2Hw
         22thJh7RBIChGfj3v5VbXFA+EyRtyO3urWACFKWvSL8838WHsaLoNSnpYSVv+Ub+Dnn6
         1Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCVf7dmLbe0v6CH0BRCp3feRbqYV1en/2eST4x8y6PpS3Zj1ESMZecoyYxIKou7heak49ICuAB93WimTbVQ3C3nGN14BECCMYsYyt3L9H0vELiJ2/yyRWB+ZsELZQmC6o1G9PprmJGeUzSLcMAZ6f23vRs3JOR/ivRyzxfar3wBQApfWzfVE
X-Gm-Message-State: AOJu0YxKNEQXj7Vsc14Czb+N8heBLfV1maaZejd7SFIqLg9KIHesN1j3
	6I4v1/yYUn7L4pjaWapHYNzgPumMWJlIHsyz8wmGz2IbwkEy+2pb
X-Google-Smtp-Source: AGHT+IEDLd5ZoDkbSEQ6trwkEJZB5AUPTmKzP6li6lPY1EkpzX1dByte/d7Cp4bPEzF+fFwFT+8AoQ==
X-Received: by 2002:a05:6a21:32aa:b0:1bd:1d0f:f14b with SMTP id adf61e73a8af0-1becd5e4c08mr4594233637.10.1719532727088;
        Thu, 27 Jun 2024 16:58:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1537337sm3463565ad.160.2024.06.27.16.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:58:46 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:58:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <Zn38tH4INnO8RgtF@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:08PM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0, which reduces keyboard
> ghosting.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

