Return-Path: <linux-input+bounces-851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF3817F73
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 02:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC0CDB20F21
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 01:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E2F17CD;
	Tue, 19 Dec 2023 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNNTEK97"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2015AC;
	Tue, 19 Dec 2023 01:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35f56f06142so32413785ab.1;
        Mon, 18 Dec 2023 17:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702950538; x=1703555338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAfdz6TYpcKZiJ0o+hZkrgPkjQvOJe3nvTKDUlPpBWI=;
        b=ZNNTEK97pKC0IFKvB1XtyLXhmvq2xKE8v9TUJ6ugJFDdHhD5dysLcb5UuXHp30D4kE
         N583Zah+nsY9v24B25mp0a76Ga3Xssg6cjq0thCKK719kkH7t2ijheaYTT4XVsyuGBHP
         35Vc+TvcMtL7/BWkFthlR8YmUkA7xLh+G2L+SVIqUwHrGPeBrBQLSVhUvOFhRvBrBQfO
         Y5/WewSSBIzNsGTguZe7DdS0BNwLayOYhZAZPlC5mfBArx/rhO2KTSY7+XQyd/AEuaTX
         uD1RCSUOgVJsrfdDEZkflqwbmlnu6eIBIR5oPFb0sEAdZfCJKg7FiNCrfKxB5QL5l9Yy
         P+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950538; x=1703555338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfdz6TYpcKZiJ0o+hZkrgPkjQvOJe3nvTKDUlPpBWI=;
        b=ounz2M8YgsEKDOiheK4UjCPkqu6Ofzcjbx6pRcPrhrgnfWb+QcPIpymjvuz72m3F17
         oETOZIrl1ySJNaflq3c1QOCsxSVz8yXygyb1PQXJvvQ3I1fnIZsq0VgnV2gDUbaXXMuJ
         AuZ9zBFHuSA694WvLJ90s6LWP3HtZrBw/GohTt7WBXMNXgxAHlJ8lBuup9YHxYNr4tgv
         2EIINgYilquDMSXai8mwjRjQ9vVAfOzLBwX2B2u199KAk4OW3RF3TylL5xypm3pkcpKN
         icliQzxvLj+XfgAPKJQNCtdOnT1qTBe76AzMpHbAO109+wMqSJbBWC3BF3OspTIK8bfV
         1CAA==
X-Gm-Message-State: AOJu0Yxq7/xrZ5lu962Yg6UHHpxNpjr9W8MDl6xnqG7jbFxXA3EbXgif
	BZe0K8hULmGN1Fs7VbsYlfY=
X-Google-Smtp-Source: AGHT+IH/3GGs2xprqEs9H2Juu3eKP4zp4HK8MfoneXDso6Z7rVcRLtCk7SAFzR6tWbYDu+1ooXjW7Q==
X-Received: by 2002:a92:c242:0:b0:35e:6ef0:6b04 with SMTP id k2-20020a92c242000000b0035e6ef06b04mr26844213ilo.68.1702950538271;
        Mon, 18 Dec 2023 17:48:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e0f5:2344:80e4:a1fc])
        by smtp.gmail.com with ESMTPSA id b24-20020a170902b61800b001cfc68aca48sm19618161pls.135.2023.12.18.17.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 17:48:57 -0800 (PST)
Date: Mon, 18 Dec 2023 17:48:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] Input: da9063 - Simplify obtaining OF match data
Message-ID: <ZYD2h9slpF4mNcQ0@google.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
 <20231213214803.9931-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213214803.9931-2-biju.das.jz@bp.renesas.com>

On Wed, Dec 13, 2023 at 09:48:00PM +0000, Biju Das wrote:
> Simplify probe() by replacing of_match_node() for retrieving match data by
> device_get_match_data().
> 
> Some minor cleanups:
>  * Remove the trailing comma in the terminator entry for the OF
>    table making code robust against (theoretical) misrebases or other
>    similar things where the new entry goes _after_ the termination without
>    the compiler noticing.
>  * Move OF table near to the user.
>  * Arrange variables in reverse xmas tree order in probe().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied, thank you.

-- 
Dmitry

