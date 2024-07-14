Return-Path: <linux-input+bounces-5026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488D930899
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2024 07:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F9711C20A71
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2024 05:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE71C10A11;
	Sun, 14 Jul 2024 05:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzM9NCvl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F01094E
	for <linux-input@vger.kernel.org>; Sun, 14 Jul 2024 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720935273; cv=none; b=RwuN2ZZG/1t/ekuJ5cBkxC2ES188dQ+J1xbWT2h04tPgNxItk4QRz4QoyJwGQzP/D1Zmvu9sCAP6JRUf5riZd5z9yjVsXkFoIkZU0HHKHKicqWAcdiAjlS9LL/gDULbyWU9QM5PgSTvVooIK/NXc6QTvYDhGlzEZUClgAENbJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720935273; c=relaxed/simple;
	bh=98BhEN07JetMjEVKAFcF7F8Fa6S5ygQ7s0E1Zw0A1GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UijFX83cKw58XMbZ0ErZKlup4GbpjlOuOMNvdFFN5gacN+4dTF3H5x+aPXxuTZqVK+ErMlAlHT3L60fuYk49+gATrUUR8Ru1q5eq07L+DKzTdDKaf7YBJZzPa+f+vRdL+/teVg+jxE+sA8TkAv2kMekyqhMWcCV/pj5ccjQXY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzM9NCvl; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d9306100b5so2225568b6e.1
        for <linux-input@vger.kernel.org>; Sat, 13 Jul 2024 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720935271; x=1721540071; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMM98B5qLImcHuA2vJ8qYUFUjxkgiMPuQv1klhzc6+s=;
        b=RzM9NCvlhRj2UZ4lvAccqfQQKCNJxpf6Tlf71ez0u8PjaoaoJ+opoq8SRxEdWIQRjY
         k91gi8wMIks7JPTyLYb3T7OTfkXEB/0dD/CHnQNkb5pIhchnTnWLXg4I8cWVZjAmzeno
         rErl4RJYJf56dJyA9i6sXkDe7rT/xbqwDfQvlCyWaMdHS56yc6mzxSLkY4HymuOAoFv9
         +HfIgSU5I9hC2YkMR8r5KR5TK/XEIsYMpuJG8iL8IiFyhoFkRXYh1WFKxci3s2WgdhY4
         VGkDRy9SrEVG91NMFCatx+itM9u9qnw31Zq+cPMMG7cDDJ9dUVUFDydngfzkhY7eEBfC
         sGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720935271; x=1721540071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMM98B5qLImcHuA2vJ8qYUFUjxkgiMPuQv1klhzc6+s=;
        b=jjU84it8URqf1IrnPQEi8uZhux14Y6lYYzVYBg9zKuPutxSPHcaFS6jG/DMt+RD8mg
         2dNvNOl95ErCB85faVfDYuxkNON2e0DnK/O7wnP1uO4k7/5xuFcxqVursJFbLFkLcBhC
         GOn9KbtsvVsUbrF7RLAhUPx9EEIbRRgo2OPjKwU4Aj8eOf4zWKQaghbO0d8OTeZImcNH
         pGIFtomc6iu9CO+G2z6Ip708QK4olY9Rpz5Pi0CmlPJ/0tiJF0cwm9DH5KHpAOhZIjpD
         arq6HqxxbteVT+w3nehuaaYOqc7yUq1XenPVpSWPsXHUmsFNAz363Wb89ucpafdnxpWY
         5B5g==
X-Gm-Message-State: AOJu0Yz4CS8C27ky+fCFpPbsiADIPuJBCdsBMXuDWiUZdiQK4m1IYDc8
	D3QtvzCuvQNSdtamO6t1fEeQSNU3BbHBl4mOdQX+G8EYRYOvyrlH
X-Google-Smtp-Source: AGHT+IFTHV9z1N3Om+1RoF6sMqhb+fNLu5CusQTIOrHm6nx1oau9gaXHmItuv5BDosAd7QU2g83/Kg==
X-Received: by 2002:aca:2112:0:b0:3d9:dcf8:3450 with SMTP id 5614622812f47-3d9dcf83b9emr12120410b6e.33.1720935271249;
        Sat, 13 Jul 2024 22:34:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:977d:d7e0:6495:8c0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecd1c97sm1999431b3a.202.2024.07.13.22.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 22:34:30 -0700 (PDT)
Date: Sat, 13 Jul 2024 22:34:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>
Cc: Linux Input <linux-input@vger.kernel.org>
Subject: Should adp5589-keys driver be removed?
Message-ID: <ZpNjZC4YbkCy38R1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael, Nuno, Utsav,

I am looking at the adp5589-keys driver and it only supports
configuration via platform data and there are no users of it in the
mainline kernel. We should either remove it if it is no longer relevant,
or change it to use generic device properties so that it can actually be
used on modern systems.

Please let me know.

Thanks.

-- 
Dmitry

