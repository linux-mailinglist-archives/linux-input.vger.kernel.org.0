Return-Path: <linux-input+bounces-4294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6409023BC
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405392884BE
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 14:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BE080639;
	Mon, 10 Jun 2024 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="E/inZr5i"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CAA56452;
	Mon, 10 Jun 2024 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028715; cv=none; b=b9epVbvS8WGcZth9qzEO/MhON0jmDqCOG1eLKQmIOMp4ms/3dyME4J+bthK888WJIyCEcE2gdtslAo7s/oZmwJvH0BN49+rIeaaImuMhbo35euIvWciuYxV1X2baZWJRwX7+OE3++w+c9dVOsQse2TDrp2ZuFHLo5vPATmgnjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028715; c=relaxed/simple;
	bh=/lhiuItvkVHmMoJg2I8J70vZt9P6vOE8r7ApFzJQBRs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Dvz78yXsRTd7z1qB8557kcou6YfpynRcQevj38qwr0TSZjEO++M6oWxVsV/qUZYR4zqNGBlL2/IHQHnEKEuv0fAP0/QZEFIIzH6EcYLLo2y+PPnSTlr336L7KOmINdfHcmiJyCMLB8reZ6CuHnxCwN83QpLGkrbQm8HAuDJGrdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=E/inZr5i; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718028707; x=1718633507; i=markus.elfring@web.de;
	bh=/lhiuItvkVHmMoJg2I8J70vZt9P6vOE8r7ApFzJQBRs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E/inZr5iQTRHk0PCU5TRQG1G/R8kPnniB+vo02wc9iREd4k1AcTbz5kGVAck66J6
	 D6130Rra7EHXrUjBT73yUsyTcK67m+ilFfhFFrsT3h80iu6ToJ7N24c+W7qbs2HZE
	 v8iiJNS6+DRbEETXdjoJlR10oxqsdMBLIUpz9BRkXpJ73LbbI7cQWccov0F0nukDy
	 CQi/I3cb2SQKwgLXUxt4tS5S4tZA7y7ZPNw9B2wd/ZTrEYRu4oM+lRheGCnn6zFtW
	 3OBkPIVo8blmJzpAQeR9kKMhjy9phVvG8c0Q5grzjDT2jRDJ+0vehC55MrJug2x8R
	 7+CuzNKTI1ldiaYcAA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gXO-1sTa5p1sfq-00xsJ0; Mon, 10
 Jun 2024 16:11:47 +0200
Message-ID: <a748619b-0702-432a-b96c-06e184c7a791@web.de>
Date: Mon, 10 Jun 2024 16:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 John Keeping <jkeeping@inmusicbrands.com>, Marek Vasut <marex@denx.de>
References: <20240609234757.610273-3-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/3] Input: ili210x - use guard notation when disabling
 and reenabling IRQ
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240609234757.610273-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:W9Au6bb2Nb9f3GU2rnfg+mjE9ytJH+R5EvXKap+iOfQuGxRXmyf
 VTUsjc7axRqM38fgI0+e7V7KkpK/Nr8WAomzRxQI0MR3o0Q4pv/lXWcHOWPqEiT4uUJbVLh
 RSvTUiR9U0HKsH6gpnIH89sXR0kWT9j31W5pul+fhlEduKVTDf4roWQadGSIqf1wFJ0pmk6
 b6DJaIRRKV67PihQ9pBzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lgfsa2PdNcA=;X/fgV8okucco5n8lsnjPQz6b5jH
 /XIcQwTwp2pdEs+WbQrHM6Ms1K07HZn0ubQad3pBNYiOC/LxofCGn9EsYnRXcUmr7XG1rFUrh
 4UU9VaC7tCjNEk/V0wn+Tbq5v6OK2TBTD8ZjEZQTuW2+gKwoOlz/l2DA0vWvoJV5FhSZgDwYV
 4uJWf6Fd22gj6LVHzIljmZjll9km2DqJlgk8+eTQhHwYnupYgN7Ien8G5yY3S5ec38lNsrJAv
 ppGI6Ezm4RgrBCRCKjhf7Pfh64x743g/oCMXC6GjKzPSWRfOXBPBdm48hJvs4YqLVkYb/JdLF
 9t/4ETe0rGKimCg2KxmrlpXLii3nS3MdNbVWO0B/3tI/2iVASWC35oyDALNAJS+UtuRKe0jv6
 X8NikMIyHJdZrqCkkWP5un1MkRWbW4RCjBVbcKvfupzUjTOsh500sTNm4Uqoi09r7HD+WFpm2
 TLOIEA9ihgL3HF+5GPSna6u2B7SVhAF879MA6mbOkMaXVxGLFWoaFKBPXOi2Tk1l0UNXOGMyI
 DNKAovdIy6qQ5ISmcCgasvcSwLP0Z5/0H8SFAAlmDLqdaR+1D0dQ5t6tvuDnWbnVsHOAi3mdw
 oEow4RHewSE4pjiq9zP6xSaR6+gRWv+8CWA/5maDb7EgTO42yhxejrSsQBB295kMdDR/euzev
 6EZ1Mb5El4MOGD5Itc54lb2FPr2Nbi/WLB+v5NClE4UG+XfIOmohBjIrFc2HZcsq8Yu4Y5LwF
 iboeWxquI6HVEoXGIyTLlc9bN//5Xn+y6od/pZ/lGMs+TnJy10acB4apYcjJYTxMu+l/C9vDj
 nUCaqHM2Kb6uI6oYhIqMcd3MC4mYp7503Lk8yPPIq2Q6c=

> This makes the code more compact and error handling more robust.

Please improve the change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc2#n94

Regards,
Markus

