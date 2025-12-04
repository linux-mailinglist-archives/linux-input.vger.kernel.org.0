Return-Path: <linux-input+bounces-16468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0983CA5B39
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 00:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52DF63080AFF
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 23:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E51A25E469;
	Thu,  4 Dec 2025 23:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="NAUnoKiX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1851207A3A;
	Thu,  4 Dec 2025 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764891817; cv=none; b=h4wVD6S8BxaueOjMm7+Mr91OYm2sOrZ13j31wqHzbGzSFCQioZYNlkwEG0CdKuxqi31YFzJ3tfHb3BCZzM/aPhIzJ7fpOPB0AFcTa+K5Cax/7tfCgcthtjzgHFKLpu+P8ft79e5QQ+jwStBld9/RJaU/ItcZ74Gi5ueSj9BbZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764891817; c=relaxed/simple;
	bh=2fkaycdvq/O4kfy+JRspU4KXpLk7bvteLhqGiO3K5SQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XYfbxu7PZNvu9YdCxF/afOH6AtFIbIsjkdIN1Vp9DfEXf+M8U1tL9wqgn2vW+J9HhTjLFKXnBOwUqe1/4Aeckk4vbUH3jFqXD7k+epDeu93WYvBNbobJyPXkLSvEoimypZp9QJTsoEIi/CeibNsyw722DXtGsIDbL2s4ZopEpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=NAUnoKiX; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id D2CBB40CA3;
	Thu,  4 Dec 2025 23:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1764891811;
	bh=2fkaycdvq/O4kfy+JRspU4KXpLk7bvteLhqGiO3K5SQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NAUnoKiXVw8TNe+GqHNcOAeiehjQT2oZ7e450TKuYzAdLsVbXqJMbWRuiWIn1qY3y
	 npSl7CWmdHjU2zBdMazHup2BOHpErgwx2TGb5Uqk/obdmBzmMW8M7hbP96rHJgXjUA
	 JVcRg2divxXnB4c907DEcvolASxm7GLJ27HZtbQinjN59tUcmX+RL9wftLvc7pzNAw
	 Aee6iaRw7+NHLF5MVzArJ1fMhqYcOM3dsfpm9FjJB98z5kDrVbvO8sCf9jPWylWdrD
	 rmC7p77lJ+fHFnu2/gMuN/1NOlp70LlDdRfjbXUN5LxqsXLxEURwsS4JTjRxr+fHT3
	 x9r4pAppZ/2WA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 00:43:31 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
In-Reply-To: <b3131f6c322ac4c62c4b00142b55fde7@davidebeatrici.dev>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
 <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
 <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
 <b3131f6c322ac4c62c4b00142b55fde7@davidebeatrici.dev>
Message-ID: <8aefde3322ab7676034cae9d291fc5b6@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> report 8 has csize=16 rsize=16
> report 0 has csize=1 rsize=8
> report 0 is too short, (1 < 8)
> 
> Which means we do enter the test and execute the memset()...

I added further debug prints to trace the flow after that:

hid-generic 0003:373B:1107.000F: report 8 has csize=16 rsize=16
hid-generic 0003:373B:1107.000F: Calling hiddev_report_event()
hid-generic 0003:373B:1107.000F: Calling hidraw_report_event()
hid-generic 0003:373B:1107.000F: Calling hid_process_report()
hid-generic 0003:373B:1107.000F: Calling hidinput_report_event()
hid-generic 0003:373B:1107.000E: report 0 has csize=1 rsize=8
hid-generic 0003:373B:1107.000E: report 0 is too short, (1 < 8)
hid-generic 0003:373B:1107.000E: Calling hidraw_report_event()
hid-generic 0003:373B:1107.000E: Calling hid_process_report()
hid-generic 0003:373B:1107.000E: Calling hidinput_report_event()
hid-generic 0003:373B:1107.0010: report 0 has csize=7 rsize=7
hid-generic 0003:373B:1107.0010: Calling hidraw_report_event()
hid-generic 0003:373B:1107.0010: Calling hid_process_report()
hid-generic 0003:373B:1107.0010: Calling hidinput_report_event()

The last report is a normal mouse movement.

