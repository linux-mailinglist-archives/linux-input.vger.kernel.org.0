Return-Path: <linux-input+bounces-13144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66795AEBFC7
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 21:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA356A342F
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 19:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616D12066F7;
	Fri, 27 Jun 2025 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaa52cM9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655B1F0E25
	for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052485; cv=none; b=GuUVMLrAWghuxhyQjCluA/yQkXoKSIQwa4F9+uHbEi3XXT+F2uDhYPd2e7ExFQ43RR7K8HSsmShhlF9oSwZicmPm0jNk2ZJ7/+mbPn9Jo9+K/VfD54jSPCrMbyEmZeeVFSVuHz7GAfaFTYGTRtd+K3WsxEUyFWAL5B9rtfPegBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052485; c=relaxed/simple;
	bh=LrYK5hTto7aSJjouzrdPvN8edD7WR4qySDLEMFWwxc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pgg1FHHOuCSPFW/6CwPJzCSySyKZj7BBbyEWV+/7DWiHAiI8mexESzN6T4O/+oyiLOm6je5VmeuWlg22du4YV7reVSX1kA70UqifdUc+s/NnejzLd/Qx00w9YJd6+2opjD4cW0/A9A9ZGq+SufOML3E46UoPGy2uCKHXQWR0Q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaa52cM9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b321bd36a41so366278a12.2
        for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751052483; x=1751657283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouSzI3ICjw3hhTCdwSJ44Kjw+r8B2A6CJ8LehO5AFPM=;
        b=jaa52cM94c+4ueHZG7ApSdJxAvG4w4N5Bty+d+S97JSco/8+qF4eJMooOITIbH/jRL
         ZflIXHH56dP7uBcKaHqobCxIaDKxXbNPPxWKdJzXK/szWQ/F8UiKsX8SCt03yiOaP+hG
         XlXGB7aNu7tuvM6TUFKJc0Xxl8vssbQ0C59fztGfgJ7BIRar5MxikeJOsjoiV0/9MEnL
         pGGVjWYqZic9SgNEuZA/IyMbs6NvPypIultvK8WrArqJvWrLISXIuidaz6aAgolYUweG
         pxltXCouu234eVAJt6ft/xJzS/PHFE6ZqlQCEBwO1HlloiJJXmCjYbO9fQyg4OGDTXtG
         PF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052483; x=1751657283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouSzI3ICjw3hhTCdwSJ44Kjw+r8B2A6CJ8LehO5AFPM=;
        b=c14hfXTct1ewJwH0C+h7vspGjc318raQXrZPELnwMn4ZL7xaBVylq6LBJhmTa8E72U
         mOLVtwsxxdu5o3VkXrnvCVza+aP0p6DkZoZKyTQNE9PQjuvyG16uUZriDXaoVrQINskG
         1M9+e2YcsU7QWnL3Ya8lSnID7E3pX7hOCE+19ZETMMKu6lMBTVfOJfssu6EzOn3OQCyl
         BHIb9O9i9yRrTfAAXliBN1eHZS18Woi+eF28bA1HLzCqOGqNemVmQ8IvOxj7Kh2jTDTI
         AjxKFtdbwr3saMt0MvU7eCGlDlmUe6O/eBgSjO44Lb92TDo1HofFvROEHcgllpun+zCi
         34tg==
X-Forwarded-Encrypted: i=1; AJvYcCVH5MuR6QbQOP6EojHVXwDvqcJAyGZX6rmFJd2BUzjjaSeK93AQYAOsw9KlFO9JzF6kaR7o+Hsmfv+QMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5NJxCDEKiqkfnYnEfm0UKzhtpoxXKeqOb+Rqfd09SHfMToq6
	WngIK4v30c1Q3QySHw1l34B+4FANEZGRJKY8LZ8qbJ2RI7GC2veRGoqE
X-Gm-Gg: ASbGncuyfpjrWKZ3FFqJc2N9wYYWgx2yWbo23Y6MLdbhNzow3qCyFKcawX7X3Tk0coB
	1/FchA4VLP75oq61eK4TpiygkteqoFQV3qPZ3LbYXr8v+DygXxXojfUkyNb9VggHeEUY8tvqZfg
	DsHULYnlJ4RFwwkUtV9m7B3ZhyKgPpv2Sha4tIUjY6GCyMHvoKTlZ1UWIZEb9HmV9sf6sz+mQ3F
	wB2hqQDkhGYl7x4afcz//2AejGSibM/iDSgoAarcGkQrC5B1regtTjaIcgj6WM8gItjezOasD+W
	Koeq3FZDbFcmLzkRDxpL3WsCjktqDOhEAYy0+HzpZ4zrXgQfiIAyV1IjRuY26w==
X-Google-Smtp-Source: AGHT+IHfxoEgCZ4NH68/C+YF6qg4/Z8xkFcXDnMSRypZENERRjK3XXFI7AsNnTwPlpKuLkIz4TeYMQ==
X-Received: by 2002:a17:90b:1c12:b0:312:959:dc49 with SMTP id 98e67ed59e1d1-318c8ef8e19mr6043934a91.13.1751052483229;
        Fri, 27 Jun 2025 12:28:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e23a3sm2946855a91.29.2025.06.27.12.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:28:02 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:28:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Vicki Pfau <vi@endrift.com>, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: xpad: Return errors from
 xpad_try_sending_next_out_packet() up
Message-ID: <vkqim6mehuihrjdeiofdt4dpdw4qqc7qnnzsr3pwaoxfnur23i@5fb27vmickx5>
References: <20250609014718.236827-1-superm1@kernel.org>
 <20250609014718.236827-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609014718.236827-3-superm1@kernel.org>

On Sun, Jun 08, 2025 at 08:46:31PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Not all errors that occur in xpad_try_sending_next_out_packet() are
> IO errors.  Pass up the error code to the caller so that it can
> decide what to to.
> 
> Cc: Vicki Pfau <vi@endrift.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied, thank you.

-- 
Dmitry

