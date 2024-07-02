Return-Path: <linux-input+bounces-4798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF9923AA4
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C62283DA7
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 09:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C729815748C;
	Tue,  2 Jul 2024 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="eifLgXRW"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7A15748B;
	Tue,  2 Jul 2024 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913828; cv=none; b=dFGY4zbTmCQmrZFQk/kj9Kbf69Rd8GAwHzEJQ/gsBHXOstgvw8v3BGKtV/4y4bzOXMljV4zqG+vLd+TMFzvItMPlVIaNsAmXR0HbFOvTyhMdYH0hTuj6Vu78oQRapwqq99YESdeBa49Muo7qwuSO10e4hyckEC2xnhGpceEmsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913828; c=relaxed/simple;
	bh=FkcdLSdW9xocNBg7uzxx+yfN9x9ctxVGXVfohvNj1KQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=n9M5YTrWz91BMEmY3a5nqd999DSmPRzJ0V9Kvcaj0yeOSGq9+ktwu+8+9IT1/zVSsF6Hyey80ZDGFV9DBwCy8ZTFdH54JbsJ3vGrwoGjChORA8Tx5eRodFRP+eO6Xmw1h6DJ6j7sYlPe5OUSbE3B2jvVcHLu1vYST90JTMXeQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=eifLgXRW; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719913815; x=1720518615; i=markus.elfring@web.de;
	bh=FkcdLSdW9xocNBg7uzxx+yfN9x9ctxVGXVfohvNj1KQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eifLgXRW5eOWwmP5DwgEI0g+L5Tu00nrGwdMdzIKD43sQJlNGJ4mgENEyI0ZtHzg
	 K63v2AiHUKFPgQLLEXp5RxKGJ9Oo/IorI1APfw9Ky00eH5HBHc+tr/+jEKcMdn2gx
	 TiY6q4kwbwtfGcs5KY5dvhIAQJXE0Dy32spTDvvg2nenAbDPID95afSqq6rUY2U5S
	 DBH3qYpRaJ6Dd4NdoQprkmmqJL+nZoos4uGCiC5YKSjdegoVhkkwyfABW/wjCG442
	 fvMUqcDGNfg9ejf6Ify+nqjUbWRIKusx9r0yP8xlQO8HbsSw6ArU7uY79U6Egfavv
	 Ra7bl6HDHOmwj4HKDQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mrfp8-1s3asN2Rt6-00cXCM; Tue, 02
 Jul 2024 11:50:15 +0200
Message-ID: <56575b8b-5721-4179-8566-6218c9affbd8@web.de>
Date: Tue, 2 Jul 2024 11:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <ZoLt_qBCQS-tG8Ar@google.com>
Subject: Re: [PATCH] Input: adp5588-keys - use guard notation when acquiring
 mutexes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZoLt_qBCQS-tG8Ar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HWuNKOu6jS4twv//0qiIKr+vEkAUkBGBD9FQ5D3sd5ymYCOXKcr
 dJ2iSX8SjvZqnPv5Zp+0EJ/RrQ4/PdslSomApoY7V8gFiWwQ5ZVg0WvwMAhX/1fncTKq7GJ
 +hAo8lPi9aIfePbkYHZmvq47bOFG9DEerceEJ43hLwjlxFD3qibAgyoDqmhnUyYF2vfGLaj
 dfnp1myTc9Hw+rzM279sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aIRSDS7Rnqc=;23LmmY/UWa0UQTEx4Hrl1c3VeIk
 Wc95fJekMVvTVtzHj5hHYQSMz75Tb8nIY8FEDuUq+gbd4scbaYiN8GgFDooNFncXPvWUvBNyO
 zswakydQz7R8KmqX/jyDiIU0cBiX+IQWnM/wI7qZ0BDwJlxV3TMxgAmcmlqlCFeRlKvt6//Sh
 qOw1BOe0r45yCeE+/mK1+Kb1+RNDzBK8Xg2fIfV0Eizws7DbxNA6/7wnSnKkyVUWNh9tQ9UCr
 I6Fztt+1r2ZuKmkBRYijWUewNKgGdnUmP3a2kMxZNiSSXFEah+J8eZ2hrB4ioGt1u1t1toQRH
 3IZs40ZMKwKC5tmRleItJP4cmdkRB4TK5HEsM+iUdVD1LF05gQwzZksaaPfHWWJW7OnwEFh+i
 PCkA3HRW+Y0TaXLSIiBrPJEv0l4UJRHLa3RvmS9Pkrjfy4G4ZSYoY3yanBvEcAtNlusQAY1N6
 TH7ZapDIbAPW9DriU2plmuBYqHaWvLYf72CTF4qiD/0f6xsqLu4o6Av9I32uk+ouhhQEUmeBo
 CLY/CVwAf+S8xQNBTeeuNljf63cJW1IedOEg5TRtkwlrSRzVJ0J/sGxGvsetSmHy/yOpK1fbo
 GbDyrRfBcGSJc+fJf/wX2TU3NzrwyW4eZT0U9qPmUWH3Hz7ytSXmFdFa9v9iSybagljCrJlHM
 EDDLWql34N2iIkRYdrb6qm1mBM4SzmouPCEwH/PLGjhJvv3AGDJeVSlqKUsAcvLAXUJ9to6W8
 fh1NRapxAYAux0XNIqsnyMx1WfqpC6fUdZfE6yX1BhW5eieuzIUqFwuNrTvbh6pWF8BkkIaNL
 vvwUYQoy3h/Msq01wzG6mCpw1ZlEXZ6X3q7Yousb+Fdw8=

> This makes the code more compact and error handling more robust.

I suggest to improve such a change description another bit.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc6#n45

Regards,
Markus

