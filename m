Return-Path: <linux-input+bounces-4308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32A903772
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 11:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B8E28486E
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 09:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29910174EDF;
	Tue, 11 Jun 2024 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdTTWjAW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F479C8;
	Tue, 11 Jun 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096841; cv=none; b=KRe5gm79chGnQOwkFuvsgto77KJoLE5qYaEYKo8NGwVOWXsira2FE3LXkHfKHW7bLba5Sbbw7DyuGU7RsnBWkRIvIhfC0oZE4akCs4kXqIpLd6qrMprdAwGMh8PNPak1i5zhfLmsM4YPIwwpc/G25MOAEibuW2Sxn5dSmMc5uoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096841; c=relaxed/simple;
	bh=fta3eaWJ2teFy38tCw6loz+bdsnwvfr48UgRw05OSpk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OaSoAqkMm3vUd9X4Rn2fp4+BJXl1I96qyJ1j6lvWKqGqA6FtQaMbWW7sHh3R9BYaFxAJlh9JGOITwGPRg83t5BpUsLBcoj6PUm1g5oxbnvIWDCtYQM7auU+jqVHa3qo7QjZZXSkMMueAfq3G2IqD1QSvlfRdgd0Jn3d3NN6CeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdTTWjAW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a52dfd081so963180a12.2;
        Tue, 11 Jun 2024 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718096838; x=1718701638; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fta3eaWJ2teFy38tCw6loz+bdsnwvfr48UgRw05OSpk=;
        b=kdTTWjAWBmHnAOT9GgQrJHQq5MbCkdKX0yfOy2h0EVCADSLCj7gzJvTjgczddy3xgK
         +jY3nK52aaWyWhoH+vQhCGYXHPqYjdCiz32eF0/wn3dNEFgPNGtzOeehK1UIBkyjzv5I
         djNlLur3NFXq1AbdR+V2G6OQ33AU8HST3teD+0Ca9mGOg2VdL1hmaKfxhUQ6BaBO0TbV
         5Nv8D21THccSklPUAhKi5LJBPzzgsrcrqirC8zIBGk6k2wGdYOfFXFRcG1gRz79Fo/ab
         Gt3pAYV5PZdnKBWu+VwzWInHA8m0teKieBpPthvVy0L5a4LEbxjQr027iW5ylpZUUnvl
         SJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096838; x=1718701638;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fta3eaWJ2teFy38tCw6loz+bdsnwvfr48UgRw05OSpk=;
        b=P7Ia8YTBRR2U9nxQzxVJrVJ7mjBohYabJQclH2R7qYNxPIc0pT4nF7E/5wLIrj7ydp
         7U7Omm5299cmRy2fDUI6h4ir1TCMgM/T6bfpEc/FF2DWrNgGrtFtFfhTsgsXo3JL6BLn
         turjvWccJjd+1+mWE4/+/tJFVKJVpx5pcDTnin1DTvn08El8XKWVs1oleiaqu0Lf38Q/
         BzQymdNJwGukiXJWGICMqtIW0GPURySoyOUsM0te+rzKqEBp2Ezm6LmtcXbQGs1L4lT4
         SIzPtvz4gdBUv2bssSdnJGie4loklX4eSj9iwWyp6LDcDrCSUqbxD/GiNUwZbN0UERJm
         ytjg==
X-Forwarded-Encrypted: i=1; AJvYcCW1OW41LAVnNoNUlQxBN63YYRANMGsQStwCSkaEEs2nKieJOILGC4LJ3yPKv90/P1Koq42TZj/8fqWjpLXgwQJCjyT2+L2ShtnzFSfnkqdPSoMGg9bmThuYf6fFnBNFAM4XBeOZucuy7zU=
X-Gm-Message-State: AOJu0Ywa49lyclvLRJVrlwRhuyJSiAXTwuRBVfpKJ4JsVCMdb6ogDaOM
	oqVMGHgTacOBmURUK+dbgKYV3CYW5QDJy6hzrkVPVx7AALD9p2QpAsDgQPDVLz0=
X-Google-Smtp-Source: AGHT+IFUG54eePiUGu+zBFQ9ykY4fx6D6aNk81Mi2rRwydImahZroEtP48tgfbOvruK25oCFTblRQQ==
X-Received: by 2002:a50:a68e:0:b0:57a:3424:b36e with SMTP id 4fb4d7f45d1cf-57c508eeee7mr7948768a12.13.1718096837577;
        Tue, 11 Jun 2024 02:07:17 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c8bb27687sm2334450a12.15.2024.06.11.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:07:17 -0700 (PDT)
Message-ID: <1f7a529ddf64179bd8892b74f7bf7dfe9947b143.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] Input: adxl34x - switch to using managed
 resources
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org,  Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 11 Jun 2024 11:11:05 +0200
In-Reply-To: <20240610164301.1048482-3-dmitry.torokhov@gmail.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
	 <20240610164301.1048482-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-06-10 at 09:42 -0700, Dmitry Torokhov wrote:
> Switch the driver to use managed resources to simplify error handling.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>



