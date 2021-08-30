Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF2D3FBF6A
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhH3X2S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:28:18 -0400
Received: from phobos.denx.de ([85.214.62.61]:58428 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239064AbhH3X2R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:28:17 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9FFBD833CF;
        Tue, 31 Aug 2021 01:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630366042;
        bh=3zigXP6Gcm/GbZfZJL4kuWCi1EP3cdtjV1eF6MTro3E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VouqHlC6YwNdXmPyIVzLH6244+2p5Efx/bpXEPAdqTcR+ZcjCTv3L3YeTycTiWLJT
         gOp/GsIyXkP/JHovrdrOI2pgqNHcw6KKG+wvh1FnJTPCninle1+pxvFEvC8hu5B893
         KjG8HQ88CWiCRgihp0U6NWjnVRffJ7z7nKIubPADG4OD8oyomG4FTLtOxRvCa70QKU
         pilL+WtT1HMRhdO0L0dDRvCi2Yl1su6Fwq89OhDdgeREX8bTxjv88GtiqAy9UurZFZ
         IbXTtnnfVxl7IAmvJi8f1mrf7DnzE54/QGiLIlZ0Jjnh5zYSjwISgGHj1qUckpvSu4
         eTzWVwrsk384w==
Subject: Re: [PATCH v2 3/3] Input: ili210x - add ili251x firmware update
 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-3-marex@denx.de> <YS1KLkCX01tlHBcy@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <3233bfac-6d9d-da86-c4f9-18a9eab326d4@denx.de>
Date:   Tue, 31 Aug 2021 01:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1KLkCX01tlHBcy@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/30/21 11:14 PM, Dmitry Torokhov wrote:

[...]

>> +	if (ret) {
>> +		dev_err(dev, "Failed to request firmware %s, ret=%d\n", fwname, ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
>> +	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
>> +	 * once, copy them all into this buffer at the right locations, and then
>> +	 * do all operations on this linear buffer.
>> +	 */
>> +	fw_buf = kcalloc(1, SZ_64K, GFP_KERNEL);
> 
> Why kcalloc and not kzalloc?

Because the firmware blob might be sparse (with gaps in it) and those 
gaps should be zeroed out instead of random data (see your question 
about the 32 byte long memcpy() below (*) as well).

>> +	if (!fw_buf) {
>> +		ret = -ENOMEM;
>> +		goto err_alloc;
>> +	}
>> +
>> +	rec = (const struct ihex_binrec *)fw->data;
>> +	while (rec) {
>> +		fw_addr = be32_to_cpu(rec->addr);
>> +		fw_len = be16_to_cpu(rec->len);
>> +
>> +		if (fw_addr + fw_len > SZ_64K) {
>> +			ret = -EFBIG;
>> +			goto err_big;
>> +		}
>> +
>> +		/* Find the last address before DF start address, that is AC end */
>> +		if (fw_addr == 0xf000)
>> +			*ac_end = fw_last_addr;
>> +		fw_last_addr = fw_addr + fw_len;
>> +
>> +		memcpy(fw_buf + fw_addr, rec->data, fw_len);
>> +		rec = ihex_next_binrec(rec);
>> +	}

[...]

>> +static int ili251x_firmware_busy(struct i2c_client *client)
>> +{
>> +	struct ili210x *priv = i2c_get_clientdata(client);
>> +	int ret, i = 0;
>> +	u8 data;
>> +
>> +	do {
>> +		/* The read_reg already contains suitable delay */
>> +		ret = priv->chip->read_reg(client, 0x80, &data, 1);
> 
> Can we have symbolic name for this register (and others).

The name of this one isn't part of the example code, so ... I can call 
it something, but who knows what it really is.

I believe I did manage to find what the other registers are called already.

[...]

>> +	ret = ili251x_firmware_busy(client);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (fw_addr = start; fw_addr < end; fw_addr += 32) {
>> +		fw_data[0] = REG_WRITE_DATA;
>> +		memcpy(&(fw_data[1]), fwbuf + fw_addr, 32);
> 
> Is it guaranteed that we have enough data (32 bytes) and we will not
> reach past the buffer?

Yes, see above (*). If the firmware blob entry were too short, this 
would pull in zeroes.

I tried iterating through the firmware file, but using linear buffer for 
the firmware results in far less convoluted code, and considering it is 
not performance critical, I think this is ok.

[...]

>> +static ssize_t ili210x_firmware_update_store(struct device *dev,
>> +					     struct device_attribute *attr,
>> +					     const char *buf, size_t count)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct ili210x *priv = i2c_get_clientdata(client);
>> +	char fwname[NAME_MAX];
>> +	u16 ac_end, df_end;
>> +	u8 *fwbuf;
>> +	int ret;
>> +	int i;
>> +
>> +	if (count >= NAME_MAX) {
>> +		dev_err(dev, "File name too long\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	memcpy(fwname, buf, count);
>> +	if (fwname[count - 1] == '\n')
>> +		fwname[count - 1] = '\0';
>> +	else
>> +		fwname[count] = '\0';
> 
> I believe the practice is to use constant firmware name based on driver
> or chip name. If there is desire to allow dynamic firmware name for
> given device I think it should be handled at firmware loader core.

There are a couple of input devices which do similar thing, see e.g.:
drivers/input/mouse/cyapa.c
drivers/input/rmi4/rmi_f34.c

The ilitek firmware contains both firmware and calibration data, so you 
might end up with a usecase where you switch between different firmware 
blobs at runtime.

That's why it is implemented this way.

[...]
