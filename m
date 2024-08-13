Return-Path: <linux-input+bounces-5560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B87950E0B
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 22:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF631F23BFE
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 20:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56631A4F3B;
	Tue, 13 Aug 2024 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="udpQwN67"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70238FB9;
	Tue, 13 Aug 2024 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723581599; cv=none; b=kDB+LqlesAZwxtdp48AePLcVXQl2+4S22mnFqAEFUfoRXeogSV1ra0tG2cNG0s4DLCobkA1yE1YgtupsneEGUZfcjDHh+NZ2UsoBL4GolIjU/RvA94YA0SLEMkLMvVJweOQlH0Q8Dx8qauokU4pdCJyXnKZXUcublcfi+Y9QEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723581599; c=relaxed/simple;
	bh=b3EY4SWzYmIQwNOrS1X29uZP6IEX+ak/XXLqUQD7Spk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrE2Q8YioYvDY7F7NvMCU3HmVXuvNBMcCAqzfdPA/if8/+0hfgcqXX4YYfBDOJhjhOJRWD2guyXRJdfeXvINn9hApak9+3ye+8lkLURkB8r0Bil/8kKnW37nYHvke4iR93NCOkPxppQrBign56lr+UCV1m/pbk9WyDGcuvxlTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=udpQwN67; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Aw6HPgNtHSv0JTB+x3MRxV4/A5VVag4qDtzrfXOgR6I=; b=udpQwN67fMWJlzBb8qfEZ7owIT
	m/27YJnrE61lK6m3Tvx0n6bpoZevRu67V9NYpUR2R4wvgYCBd7nlMTLftJLEHS+5jKk2D+vqYoSoB
	sZ8hcH5nydNAw2JhMOAel5bZcsZBnR06qDOMMUkyQFppKam8rIzek6N6qcgRSdSJVEulCRoZzVIBV
	Ic78h9QGlfkadTfYXVv/yMqhKojtEBUuDaiMeolt1ipabsWJLzFGuhm1PFCulLy93w4IORh4lb/Aw
	7+732fzymxsrcNauSKX11udR8K/XbynjMfpjcf7ZL5oNSB4llBoGSqBnSzw/OkpY/7t9au54p8vb2
	f3ejNk3A==;
Received: from i53875b02.versanet.de ([83.135.91.2] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sdyIu-0004Fs-Ho; Tue, 13 Aug 2024 22:39:40 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: lee@kernel.org, jdelvare@suse.com, dmitry.torokhov@gmail.com,
 pavel@ucw.cz, Guenter Roeck <linux@roeck-us.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject:
 Re: [PATCH v4 5/7] hwmon: add driver for the hwmon parts of qnap-mcu devices
Date: Tue, 13 Aug 2024 22:39:38 +0200
Message-ID: <7628765.mr9Zh2SJbS@diego>
In-Reply-To: <fd1db8a4-9ea5-49b2-9316-65bf3753a7fa@roeck-us.net>
References:
 <20240810184743.277248-1-heiko@sntech.de>
 <20240810184743.277248-6-heiko@sntech.de>
 <fd1db8a4-9ea5-49b2-9316-65bf3753a7fa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Guenter,

Am Dienstag, 13. August 2024, 18:03:57 CEST schrieb Guenter Roeck:
> On 8/10/24 11:47, Heiko Stuebner wrote:

> > +static int qnap_mcu_hwmon_set_pwm(struct qnap_mcu_hwmon *hwm, u8 pwm)
> > +{
> > +	const u8 cmd[] = {
> > +		[0] = 0x40, /* @ */
> > +		[1] = 0x46, /* F */
> > +		[2] = 0x57, /* W */
> > +		[3] = 0x30, /* 0 ... fan-id? */
> > +		[4] = pwm
> > +	};
> > +
> > +	/* set the fan pwm */
> > +	return qnap_mcu_exec_with_ack(hwm->mcu, cmd, sizeof(cmd));
> > +}

> > +static int qnap_mcu_hwmon_get_cooling_data(struct device *dev, struct qnap_mcu_hwmon *hwm)
> > +{
> > +	struct fwnode_handle *fwnode;
> > +	int num, i, ret;
> > +
> > +	fwnode = device_get_named_child_node(dev->parent, "fan-0");
> 
> Is the dummy "-0" index mandated somewhere ?

I don't think it is. The node should just begin with "fan" I think.

I've added the -0 because from everything I've seen of the qnap software-
side, the mcu firmware can address multiple fans.

In the original firmware, everything is done in userspace wrt. the MCU,
and the fan commands in their abstraction layer allow for multiple fans.

Also there is that suspicious "0" in the command sequence when
getting/setting the fan pwm. And in the original device config this is
labeled as the first fan.

From everything I've seen, the MCU is not limited to the Rockchip-line
of devices and I do hope others will find this useful in the future,
so adding the "-0" was a better safe than sorry choice.

Because that way adding that theoretical 2nd fan in the future won't
cause too much trouble in the dt-binding.


> I don't care either way, it just seems odd. Either case,
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> > +	if (!fwnode)
> > +		return 0;
> > +
> > +	/* if we found the fan-node, we're keeping it until device-unbind */
> > +	hwm->fan_node = fwnode;
> > +	ret = devm_add_action_or_reset(dev, devm_fan_node_release, hwm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!fwnode_property_present(fwnode, "cooling-levels"))
> > +		return 0;
> > +
> 
> Side note: One could argue that a sub-node with no content does not really
> make sense and should be invalid.

I remember thinking about that, but didn't come to a real decision on my
own, hence left it as it was. So will follow your suggestion :-)


> > +	ret = fwnode_property_count_u32(fwnode, "cooling-levels");
> > +	if (ret <= 0) {
> > +		dev_err(dev, "Failed to count elements in 'cooling-levels'\n");
> > +		return ret ? : -EINVAL;
> > +	}
> > +
> > +	num = ret;
> 
> Another side note: Using ret here isn't necessary. I'd just have used
> 'num' directly.

will do

> 
> > +	hwm->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
> > +					       GFP_KERNEL);
> > +	if (!hwm->fan_cooling_levels)
> > +		return -ENOMEM;
> > +
> > +	ret = fwnode_property_read_u32_array(fwnode, "cooling-levels",
> > +					     hwm->fan_cooling_levels, num);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to read 'cooling-levels'\n");
> > +		return ret;
> > +	}
> > +
> > +	for (i = 0; i < num; i++) {
> > +		if (hwm->fan_cooling_levels[i] > hwm->pwm_max) {
> > +			dev_err(dev, "fan state[%d]:%d > %d\n", i,
> > +				hwm->fan_cooling_levels[i], hwm->pwm_max);
> > +			return -EINVAL;
> 
> In case you send another version, you might want to consider using dev_err_probe().

ok will do.

I was probably way overthinking if I should not use dev_err_probe in a
function that is not a probe function (though of course part of the probe
process).


Thanks a lot for looking over the code once again
Heiko



