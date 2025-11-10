Return-Path: <linux-input+bounces-15967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB4C44BDA
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 02:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582A63A71D9
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 01:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA1C1FF61E;
	Mon, 10 Nov 2025 01:40:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.205.26])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC13194A73;
	Mon, 10 Nov 2025 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.205.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762738807; cv=none; b=okf+emDZE8pOkTHv+M7gZT48+fRe3chcJT5m5PF4i7vpyGNWKIkZCaeZuk7mrZ6qzNGsx+kxh/nzhMv42TBUNSgav8s2xWiwafaeCZEoGAlci0RiimbF/xScA68qlDTbbjlC4SwCiODwPJS0mqtCxpvp84vWJv/ZMHe0FsqKPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762738807; c=relaxed/simple;
	bh=uI2nNhEQ/GZqESjS3Ci8zByNzr42wVjplUtaVkmwfw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=h0gxThEGHHwkRmyF160hmF3awcRQP6PCB6nEjU0daYoA8NIJfjPFsZOcpfpSFix/Gca21zWKZmUNwdwSJtStDFirnCqD1m8gj8Ohin00P4hk1Un8Kkfn71dT05jjlvzvammLjF9ZhhvGB+3uckXU5yJp7zYkA4/yvflXFW/o78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.229.205.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.186])
	by mtasvr (Coremail) with SMTP id _____wBnYGtYQhFpRvN9Aw--.1942S3;
	Mon, 10 Nov 2025 09:39:37 +0800 (CST)
Received: from duoming$zju.edu.cn ( [218.12.19.186] ) by
 ajax-webmail-mail-app4 (Coremail) ; Mon, 10 Nov 2025 09:39:35 +0800
 (GMT+08:00)
Date: Mon, 10 Nov 2025 09:39:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com, kuba@kernel.org,
	alexander.deucher@amd.com, pali@kernel.org,
	hverkuil+cisco@kernel.org, akpm@linux-foundation.org,
	tglx@linutronix.de, mingo@kernel.org, Jonathan.Cameron@huawei.com
Subject: Re: [PATCH 0/2] Input: alps/psmouse: Fix UAF bugs and improve
 workqueue synchronization
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250620(94335109) Copyright (c) 2002-2025 www.mailtech.cn zju.edu.cn
In-Reply-To: <aRC9spWVq43qJWRj@smile.fi.intel.com>
References: <cover.1762604516.git.duoming@zju.edu.cn>
 <aRC9spWVq43qJWRj@smile.fi.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6e139646.22eff.19a6b6b24af.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zi_KCgCnXoVYQhFp4RgnAw--.10497W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwQGAWkQ7n8DWgAAsx
X-CM-DELIVERINFO: =?B?zhuWSQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR18AP1O1qE14oa8FDAjuhjbeRK0Kj2SFX44oHzyte4ZkH7QsSnvrFOrlAV4NCRAPS3vgx
	uyY40kOhStlqexO5BiBLjkiNhKrdqOO0RLrZhKfBIMokf4o23YMr4YGifafL1g==
X-Coremail-Antispam: 1Uk129KBj93XoW7WFykCFyDXF4ftw4kXr1DurX_yoW8JFWUpF
	WrJFW7K3ykGa4UCr93Jw4xZFW8ArnxtryxtF45Gr43Cw15Xr98GrWfKrsY93W5Kr13G3W2
	yFWqq393uFy5Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUQEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4xvF2IEb7IF0Fy264kE64k0F24lFcxC0VAYjxAxZF0Ex2IqxwAC
	I402YVCY1x02628vn2kIc2xKxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwCE64xvF2IEb7IF0Fy7YxBIdaVFxhVjvjDU0xZFpf9x07j8GYJUUUUU=

T24gU3VuLCAwOSBOb3YgMjAyNSAxODoxMzozOCArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVzc2VzIHVzZS1hZnRlci1mcmVlIGJ1Z3MgaW4g
dGhlIEFMUFMKPiA+IHRvdWNocGFkIGRyaXZlciBhbmQgZW5oYW5jZXMgd29ya3F1ZXVlIGhhbmRs
aW5nIGVmZmljaWVuY3kKPiA+IGluIHRoZSBwc21vdXNlIHN1YnN5c3RlbS4KPiA+IAo+ID4gVGhl
IGZpcnN0IHBhdGNoIGZpeGVzIGEgY3JpdGljYWwgdXNlLWFmdGVyLWZyZWUgcmFjZSBjb25kaXRp
b24KPiA+IGluIHRoZSBBTFBTIGRyaXZlciB3aGVyZSBkZXYzX3JlZ2lzdGVyX3dvcmsgY291bGQg
YmUgc2NoZWR1bGVkCj4gPiBhZnRlciB0aGUgYWxwc19kYXRhIHN0cnVjdHVyZSB3YXMgYWxyZWFk
eSBmcmVlZC4gVGhpcyB3YXMgY2F1c2VkCj4gPiBieSBpbnN1ZmZpY2llbnQgc3luY2hyb25pemF0
aW9uIGR1cmluZyBkZXZpY2UgZGlzY29ubmVjdGlvbiwKPiA+IHdoZXJlIGZsdXNoX3dvcmtxdWV1
ZSgpIGNvdWxkbid0IHByZXZlbnQgc3Vic2VxdWVudCB3b3JrIGl0ZW0KPiA+IHN1Ym1pc3Npb25z
Lgo+ID4gCj4gPiBUaGUgc2Vjb25kIHBhdGNoIG9wdGltaXplcyB0aGUgcHNtb3VzZSBkaXNjb25u
ZWN0IHBhdGggYnkgcmVwbGFjaW5nCj4gPiBmbHVzaF93b3JrcXVldWUoKSB3aXRoIGRpc2FibGVf
ZGVsYXllZF93b3JrX3N5bmMoKSBmb3IgYmV0dGVyCj4gPiBlZmZpY2llbmN5IGFuZCByb2J1c3Ru
ZXNzLgo+IAo+IFlvdSBmb3Jnb3QgdHdvIHRoaW5nczoKPiAxKSBtYWtlIGl0IHYyIChydW4gYGdp
dCBmb3JtYXQtcGF0Y2ggLXY8WD4gLi4uYCB3aGVyZSA8WD4gaXMgdGhlIHZlcnNpb24pOwo+IDIp
IGNoYW5nZWxvZy4KPiAKPiBObyBuZWVkIHRvIHJlc2VuZCAodW5sZXNzIHJlcXVlc3RlZCBieSB0
aGUgbWFpbnRhaW5lciksIGp1c3QgcmVwbHkgd2l0aCB0aGUKPiBtaXNzZWQgY2hhbmdlbG9nIGZv
ciBub3cuCgpUaGUgY2hhbmdlcyBpbiB0aGlzIHZlcnNpb24gaW5jbHVkZSB0aGUgZm9sbG93aW5n
OgoxKSBTcGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2ggaW50byB0d28gc2VwYXJhdGUgcGF0Y2hlcyAo
cHNtb3VzZS1iYXNlIGFuZCBhbHBzKS4KMikgRm9yIHRoZSBwc21vdXNlIHBhdGNoLCBmb2N1cyBv
biB0aGUgcm9idXN0bmVzcyBhbmQgZWZmaWNpZW5jeSBpbXByb3ZlbWVudHMKICAgb2YgZGlzYWJs
ZV9kZWxheWVkX3dvcmtfc3luYygpLMKgbm90IG9uwqB0aGUgVUFGIGFzcGVjdC4KCkJlc3QgUmVn
YXJkcywKRHVvbWluZyBaaG91Cg==


