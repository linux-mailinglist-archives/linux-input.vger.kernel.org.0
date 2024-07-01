Return-Path: <linux-input+bounces-4758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E139091DCFD
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 12:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8711C214A7
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D36A33B;
	Mon,  1 Jul 2024 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7XYox2o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1892770E6;
	Mon,  1 Jul 2024 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719830787; cv=none; b=ucjrTDbVXGY3oA5WmQuHvmmbk2VOHOIS3pQOqQVu3Y24NvK+FFeJonoIDDIOeznsrJbhrLlQ9m2VY/luK5m0OGeEq0uyVLFRyIjZvKFUuosMS6mKRYNvE6qgWOwFxVW0G9u4z/Lsegw53xBQBrozIX9LNrh2yytMTcVCNsxt8uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719830787; c=relaxed/simple;
	bh=+GWwp7BZyeiCr0bRF9W7x/gTSmPZTt0iUoqHGzc9sVY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYmWFQ3Wj/Ldmx2tUdAfogADtsdozyaAk0d2H4yz45X3+Rla+PTxplJxgOiX8LrUPFXdQS7tUG2ScBMHxxT21XZ5oko+6uwHz1i0Zt1e5okz5COLSAt9OYebDEGQpyKxD7xXA+d0vlqi9FzRtzNMVFWgN9OLq2X/PvsWOQafam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7XYox2o; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d251b5fccso120524a12.0;
        Mon, 01 Jul 2024 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719830784; x=1720435584; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+GWwp7BZyeiCr0bRF9W7x/gTSmPZTt0iUoqHGzc9sVY=;
        b=H7XYox2o8IOyOFdG5+vDydJkBDpWeNQ6VHiEEQFC/jo0wGubOKt8tiM8AVqY21V5yI
         n8ChHqtLmV2j4TfrncfRDNOTCZXbHYHAX224oYkirwwHpHWCBOBOvyMvdu/vsSkySsx3
         T7RtwZ4AHWopFcFO5vnogLvBbN8uRcDlhp6+7hN65sQe753KnnwL9OZQ7WJ46IYKrjVx
         IZtW13u6NKwyiYGZR5ziNM9BK9yRuydnb3UEVb4QozOdS5BlpF2XtLzoZLZMtMUOMUZb
         IRWg7Y4zPdArd6umVMY1F1GXUmC0RjcFkZ4/VL9BllBytmmbm8HvD7TWgBMX10NqsZeh
         Cq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719830784; x=1720435584;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GWwp7BZyeiCr0bRF9W7x/gTSmPZTt0iUoqHGzc9sVY=;
        b=RRS4CeFOpN4lNNfPFHO1PHbiBY3yqGrpMiCGHZiiNbdoKSEOtsyM4ndZJ8ab+ePkU+
         pG+9MIfEx/j4bCcrecGYiZJDth/lWaz4487aUo1ATlAxJhd6V7VEtPihXUzZt5kqivTN
         ntXVEYcJAyCIyWO7ddV7gQ6bq+dbyaiPuYVvQOvd944L05wdgl94JuRDSO+5yd0HuItf
         JiX/hUmnK/QHJ/CFfPX1w2xVVtv9GPqlrHxCGAbBguVATTT2WGkGnz81imslogwslFCp
         34eeyQdk9UUZp8K6SA/IpwzyTB32epOthyUZ0hXcXmvFWoqwkwxhOknzkG1j9xmx7kKz
         hCDg==
X-Forwarded-Encrypted: i=1; AJvYcCU9JzVygwz2J7aRNCfm1KSZYTZ/4mldCvu+oWWdXi0oD24cIld3yCvPttNT6U3QTpFKFvdveuNkHraZqIn72CkjR42NE9ydmN9eCVFtXjJpQwmpPhcr09PkVo40KpOTq254QTUhUglw6bA=
X-Gm-Message-State: AOJu0YxYe7zKqqNnN7UrEteDa0/kMzSvd0aguH2F+XJERKVbjB4L4IjS
	0erJzkwkz1GDCaDk8tlS5ibayIkVqKaZHKUMKeDxtfjJOe5CWCWO
X-Google-Smtp-Source: AGHT+IEHC6BLROwpxdJYFjHPGy7yHaYl7t3ABtvtEuL8J2t0FkfZbYtJ8zbgpQC7cQMcPEF+UiG8sA==
X-Received: by 2002:a05:6402:1d4b:b0:57d:15ee:3d18 with SMTP id 4fb4d7f45d1cf-5879f984d05mr3469882a12.20.1719830783884;
        Mon, 01 Jul 2024 03:46:23 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50a6bsm4218065a12.66.2024.07.01.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 03:46:23 -0700 (PDT)
Message-ID: <9bcd2aefd15890f8957e2b2bd767b05a64acb659.camel@gmail.com>
Subject: Re: [PATCH v3] adp5588-keys: Support for dedicated gpio operation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>, "Hennerich, Michael"
	 <Michael.Hennerich@analog.com>, "dmitry.torokhov@gmail.com"
	 <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	 <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Cc: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>, "Bimpikas,
 Vasileios" <Vasileios.Bimpikas@analog.com>, "Gaskell, Oliver"
 <Oliver.Gaskell@analog.com>
Date: Mon, 01 Jul 2024 12:50:15 +0200
In-Reply-To: <SJ0PR03MB634333C6AE67823F421B08B59BD32@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
	<SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <SJ0PR03MB634322A27945D27D047DCFFE9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <SJ0PR03MB634333C6AE67823F421B08B59BD32@SJ0PR03MB6343.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Utsav,


On Mon, 2024-07-01 at 10:43 +0000, Agarwal, Utsav wrote:
> It seems like there's a typo in the patch from an earlier version of the
> file(dev_err is supplied struct device rather than a struct device pointe=
r).=20
>=20
> I will be resubmitting it, apologies for the same.
>=20

Don't toppost :)...

Also, you're still missing the bindings patch and you're not properly inclu=
ding
a changelog between different versions of your patches.

- Nuno S=C3=A1
>=20


