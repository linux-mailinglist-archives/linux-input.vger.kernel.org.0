Return-Path: <linux-input+bounces-11952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A47A9A519
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86D83A8336
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 07:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7D1F7586;
	Thu, 24 Apr 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="a1R9o3BD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AqO9ssO0"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CE1F5616;
	Thu, 24 Apr 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481607; cv=none; b=KZjpezBuqwuCxhRjAQG+3DRyk2QTptrgY/gtudxW1aCvT2OwhgEhr9nTNwdYE2flT2vETTkOxd/m66M8tcMGOUQkshkvzl6W3XuELlw+4HijmRaDed36SCVWE6eXi9doitlLWcDsOO79stRHKbXoqNoRTYPcZC8bmp6+rsPDxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481607; c=relaxed/simple;
	bh=oc7MkbyEHI0jmohHyp3HOjrz/Rq49FEipRcCOk3Ft4c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HXZ5CLrD+P/y1lvJ8gAnqWuNyxrQJsi6kutg5nSpwBUiJ+512qjLo0O5aPh0NKVCmXvSTU9pDgUJDrcAfR1F38tErSbtaPHfsYG1ukzmGjYp3IXQw7S1Izh1pmBZaB9QQO7f0HZes2ci404k+dIRHTSbNOEe6B8OSqPrPmHdwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=a1R9o3BD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AqO9ssO0; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 343301140083;
	Thu, 24 Apr 2025 04:00:04 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-04.internal (MEProxy); Thu, 24 Apr 2025 04:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1745481604; x=1745568004; bh=D9BxmcOlj48skfTkt5tTv4HRI52Kr3br
	Pmi2tjpeVrs=; b=a1R9o3BDj43M5ULYH0efGR5bqc6K9OTMot7Vc0LLRwlWz/NW
	w+itHYaPgsfBd1lu9HLGEFB6+FpOr142EdmyM3ZM0D9vnfqRVLxEILPcVdlpW0+y
	FNVwYkFSS/ySKw5RAaqI2qnLp/zb9+D9reObD6azG+o86BfxoILtge7zfLIDQbpJ
	JPmIkEP9runnRZcnKP6l7B5FrhjJxKbjHDZ6EuXNweYC2Ddi2DP/xyvZ0fa06wXw
	KSEXur6+M8MMlRManClAd/eKAqvP/nR8a5Yg/3eQ/4U9mcO39dF6u9EoJtXhMtyW
	pcNem2A+YFT/rs+RXmgIMaeBGHrohCKQJoqDOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745481604; x=
	1745568004; bh=D9BxmcOlj48skfTkt5tTv4HRI52Kr3brPmi2tjpeVrs=; b=A
	qO9ssO0DkSiUpjH/ieHbj9ZvuK5vo2tbqaOALMv78uunf/cUxueFDWkY2nx+d43g
	KMihbJ6TIJbBBVI8pn/eERYSNHwsflCekckWMzfKg4rl8GZbBC5QT2b2qAxnzgm/
	7tFksBepi+5GAy/Q3cuAeg6EyGJhBudl3XSRNT91UBMr8ZU69VqP+OC/JVnQGqDu
	f0m7U9OEH4TeWihwQzizCSyxZsnKVdH1u1e/VPbdFiTc3WhbFXjPfn0Mp087I5xG
	C7Qp17awNCoBX/bfaLcoFY1IgD7YGYoc7yu4hPRhbfFTgXNq9Og/weUODXLtAPdn
	+MjNyvS36NQM7dtsynh+Q==
X-ME-Sender: <xms:g-8JaAn-Xv7-FKukOTiSfay5mCemT1Qn-kW58XMOJi1R4oDWDZr3Cg>
    <xme:g-8JaP1b8Oxs6VMsTgzb95liJooxtVN3qxKyQjaD1WACF_gZyZA6r1QkgexKKhsUQ
    8IbYSXvOwOCej4g8Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpeetlhhishhtrghirhcuoegrlhhishhtrghirhesrghlihhsthgrih
    hrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepheejffegleelgfffhfetheevvdfhkeef
    feeluedvheduiedtudevgefgiefggeffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
    pdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvh
    hilhhlvghnvghuvhgvseguihhmohhnohhffhdrtghomhdprhgtphhtthhopehmghhonhgv
    lhhlrggsohhlughutgesughimhhonhhofhhfrdgtohhmpdhrtghpthhtohepughmihhtrh
    ihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehhuhhgoheshhhu
    ghhovhhilhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopehmfigvihhgrghnugesmhifvghighgrnhgurdhnvght
    pdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:g-8JaOrQmP-TQEbJPiYlVSUoufRiDvr3ZLtHk-hlbGsBUJXjdPSUzg>
    <xmx:g-8JaMmbXuj1voDF0RF-qtOPX4t93NWRmfgdYZuot7D5RY1YPTyylw>
    <xmx:g-8JaO2uzhdQt3I-u5ClnqGf7QuGItdsfFJS6rzvfxXuHHPTP5aOPg>
    <xmx:g-8JaDsFjB0GZuNj_QTErCml1SZ-BYHNYAlfTR9NeOGZhJnrlr6i3A>
    <xmx:hO8JaLdWQ1ZrLU0tfCieulk6DoJHx5StThSkoEL_g6FYq3z7NTfy22UN>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B6254336007E; Thu, 24 Apr 2025 04:00:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T59643a954d2ed3f9
Date: Thu, 24 Apr 2025 18:00:02 +1000
From: Alistair <alistair@alistair23.me>
To: "Hugo Villeneuve" <hugo@hugovil.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Maximilian Weigand" <mweigand@mweigand.net>
Cc: "Mikael Gonella-Bolduc" <mgonellabolduc@dimonoff.com>,
 stable@vger.kernel.org, "Hugo Villeneuve" <hvilleneuve@dimonoff.com>,
 linux-input@vger.kernel.org,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Message-Id: <ed682022-509e-452b-b4f8-7ddeb17a2475@app.fastmail.com>
In-Reply-To: <20250423135243.1261460-1-hugo@hugovil.com>
References: <20250423135243.1261460-1-hugo@hugovil.com>
Subject: Re: [PATCH v2] Input: cyttsp5 - fix power control issue on wakeup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025, at 11:52 PM, Hugo Villeneuve wrote:
> From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> 
> The power control function ignores the "on" argument when setting the
> report ID, and thus is always sending HID_POWER_SLEEP. This causes a
> problem when trying to wakeup.
> 
> Fix by sending the state variable, which contains the proper HID_POWER_ON or
> HID_POWER_SLEEP based on the "on" argument.
> 
> Fixes: 3c98b8dbdced ("Input: cyttsp5 - implement proper sleep and wakeup procedures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> Changes for v2:
> - Add Mikael SOB tag
> 
> drivers/input/touchscreen/cyttsp5.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> index eafe5a9b89648..86edcacb4ab3e 100644
> --- a/drivers/input/touchscreen/cyttsp5.c
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -580,7 +580,7 @@ static int cyttsp5_power_control(struct cyttsp5 *ts, bool on)
> int rc;
>  
> SET_CMD_REPORT_TYPE(cmd[0], 0);
> - SET_CMD_REPORT_ID(cmd[0], HID_POWER_SLEEP);
> + SET_CMD_REPORT_ID(cmd[0], state);
> SET_CMD_OPCODE(cmd[1], HID_CMD_SET_POWER);
>  
> rc = cyttsp5_write(ts, HID_COMMAND_REG, cmd, sizeof(cmd));
> 
> base-commit: 7adf8b1afc14832de099f9e178f08f91dc0dd6d0
> -- 
> 2.39.5
> 
> 

