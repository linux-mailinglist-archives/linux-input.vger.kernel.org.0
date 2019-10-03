Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A392FC98EA
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 09:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfJCHTc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 03:19:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37212 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfJCHTb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Oct 2019 03:19:31 -0400
Received: from [IPv6:2a02:ab04:3ab:4f00::3] (2a02-ab04-03ab-4f00-0000-0000-0000-0003.dynamic.v6.chello.sk [IPv6:2a02:ab04:3ab:4f00::3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: andrewsh)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2692E28F7D1;
        Thu,  3 Oct 2019 08:19:29 +0100 (BST)
Subject: Re: [PATCH v3] HID: add driver for U2F Zero built-in LED and RNG
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc:     =?UTF-8?B?SmnFmcOtIEtvc2luYQ==?= <jikos@kernel.org>,
        linux-input@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>
References: <20190401124200.17331-1-andrew.shadura@collabora.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.shadura@collabora.co.uk; prefer-encrypt=mutual;
 keydata=
 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
 0luvG8t7
Organization: Collabora
To:     linux-usb@vger.kernel.org
Message-ID: <43025708-080e-b577-031a-840b4cd42f3f@collabora.co.uk>
Date:   Thu, 3 Oct 2019 09:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190401124200.17331-1-andrew.shadura@collabora.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01/04/2019 14:42, Andrej Shadura wrote:
> U2F Zero supports custom commands for blinking the LED and getting data
> from the internal hardware RNG. Expose the blinking function as a LED
> device, and the internal hardware RNG as an HWRNG so that it can be used
> to feed the enthropy pool.
> 
> Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>

I’ve been testing this with a different modification of U2F Zero,
Nitrokey FIDO U2F, and on that device only I’m getting a kernel warning
(see below).

> +static int u2fzero_recv(struct u2fzero_device *dev,
> +			struct u2f_hid_report *req,
> +			struct u2f_hid_msg *resp)
> +{
> +	int ret;
> +	struct hid_device *hdev = dev->hdev;
> +	struct u2fzero_transfer_context ctx;
> +
> +	mutex_lock(&dev->lock);
> +
> +	memcpy(dev->buf_out, req, sizeof(struct u2f_hid_report));
> +
> +	dev->urb->context = &ctx;
> +	init_completion(&ctx.done);
> +
> +	ret = usb_submit_urb(dev->urb, GFP_NOIO);

Here, usb_submit_urb() returns EBUSY in the first attempt to read random
numbers from the device:

URB ffff917256d5d540 submitted while active
WARNING: CPU: 3 PID: 31 at drivers/usb/core/urb.c:363
usb_submit_urb+0x4c2/0x5b0
<...>
Call Trace:
 u2fzero_rng_read+0x16e/0x340 [hid_u2fzero]
 ? ttwu_do_activate+0x67/0x90
 add_early_randomness+0x53/0xc0
 hwrng_register+0x175/0x180
 devm_hwrng_register+0x41/0x7e
 u2fzero_probe+0x2dd/0x350 [hid_u2fzero]
 hid_device_probe+0x119/0x180 [hid]
 really_probe+0xfe/0x3b0
 driver_probe_device+0xba/0x100
 __device_attach_driver+0x97/0x100

I don’t understand why since 1) it’s likely to be the first transmission
of this URB, 2) there’s a mutex locked just before it. I received a
comment from a colleague mentioning I’m probably not using the mutex
correctly, but I don’t understand why.

I’m trying to figure this out, so I’d welcome any help with it.

Thanks in advance.

> +	if (unlikely(ret)) {
> +		hid_err(hdev, "usb_submit_urb failed: %d", ret);
> +		goto err;
> +	}
> +
> +	ret = hid_hw_output_report(dev->hdev, dev->buf_out,
> +				   sizeof(struct u2f_hid_msg));
> +
> +	if (ret < 0) {
> +		hid_err(hdev, "hid_hw_output_report failed: %d", ret);
> +		goto err;
> +	}
> +
> +	ret = (wait_for_completion_timeout(
> +		&ctx.done, msecs_to_jiffies(USB_CTRL_SET_TIMEOUT)));
> +	if (ret < 0) {
> +		usb_kill_urb(dev->urb);
> +		hid_err(hdev, "urb submission timed out");
> +	} else {
> +		ret = dev->urb->actual_length;
> +		memcpy(resp, dev->buf_in, ret);
> +	}
> +
> +err:
> +	mutex_unlock(&dev->lock);
> +
> +	return ret;
> +}

<...>

> +static int u2fzero_rng_read(struct hwrng *rng, void *data,
> +			    size_t max, bool wait)
> +{
> +	struct u2fzero_device *dev = container_of(rng,
> +		struct u2fzero_device, hwrng);
> +	struct u2f_hid_report req = {
> +		.report_type = 0,
> +		.msg.cid = CID_BROADCAST,
> +		.msg.init = {
> +			.cmd = U2F_CUSTOM_GET_RNG,
> +			.bcnth = 0,
> +			.bcntl = 0,
> +			.data  = {0},
> +		}
> +	};
> +	struct u2f_hid_msg resp;
> +	int ret;
> +	size_t actual_length;
> +
> +	if (!dev->present) {
> +		hid_dbg(dev->hdev, "device not present");
> +		return 0;
> +	}
> +
> +	ret = u2fzero_recv(dev, &req, &resp);
> +	if (ret < 0)
> +		return 0;
> +
> +	/* only take the minimum amount of data it is safe to take */
> +	actual_length = min3((size_t)ret - offsetof(struct u2f_hid_msg,
> +		init.data), U2F_HID_MSG_LEN(resp), max);
> +
> +	memcpy(data, resp.init.data, actual_length);
> +
> +	return actual_length;
> +}

<...>

> +static int u2fzero_init_hwrng(struct u2fzero_device *dev,
> +			      unsigned int minor)
> +{
> +	dev->rng_name = devm_kasprintf(&dev->hdev->dev, GFP_KERNEL,
> +		"%s-rng%u", DRIVER_SHORT, minor);
> +	if (dev->rng_name == NULL)
> +		return -ENOMEM;
> +
> +	dev->hwrng.name = dev->rng_name;
> +	dev->hwrng.read = u2fzero_rng_read;
> +	dev->hwrng.quality = 1;
> +
> +	return devm_hwrng_register(&dev->hdev->dev, &dev->hwrng);
> +}
> +
> +static int u2fzero_fill_in_urb(struct u2fzero_device *dev)
> +{
> +	struct hid_device *hdev = dev->hdev;
> +	struct usb_device *udev;
> +	struct usbhid_device *usbhid = hdev->driver_data;
> +	unsigned int pipe_in;
> +	struct usb_host_endpoint *ep;
> +
> +	if (dev->hdev->bus != BUS_USB)
> +		return -EINVAL;
> +
> +	udev = hid_to_usb_dev(hdev);
> +
> +	if (!usbhid->urbout || !usbhid->urbin)
> +		return -ENODEV;
> +
> +	ep = usb_pipe_endpoint(udev, usbhid->urbin->pipe);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	dev->urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!dev->urb)
> +		return -ENOMEM;
> +
> +	pipe_in = (usbhid->urbin->pipe & ~(3 << 30)) | (PIPE_INTERRUPT << 30);
> +
> +	usb_fill_int_urb(dev->urb,
> +		udev,
> +		pipe_in,
> +		dev->buf_in,
> +		HID_REPORT_SIZE,
> +		u2fzero_read_callback,
> +		NULL,
> +		ep->desc.bInterval);
> +
> +	return 0;
> +}
> +
> +static int u2fzero_probe(struct hid_device *hdev,
> +			 const struct hid_device_id *id)
> +{
> +	struct u2fzero_device *dev;
> +	unsigned int minor;
> +	int ret;
> +
> +	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (dev == NULL)
> +		return -ENOMEM;
> +
> +	dev->buf_out = devm_kmalloc(&hdev->dev,
> +		sizeof(struct u2f_hid_report), GFP_KERNEL);
> +	if (dev->buf_out == NULL)
> +		return -ENOMEM;
> +
> +	dev->buf_in = devm_kmalloc(&hdev->dev,
> +		sizeof(struct u2f_hid_msg), GFP_KERNEL);
> +	if (dev->buf_in == NULL)
> +		return -ENOMEM;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	dev->hdev = hdev;
> +	hid_set_drvdata(hdev, dev);
> +	mutex_init(&dev->lock);
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
> +		return ret;
> +
> +	u2fzero_fill_in_urb(dev);
> +
> +	dev->present = true;
> +
> +	minor = ((struct hidraw *) hdev->hidraw)->minor;
> +
> +	ret = u2fzero_init_led(dev, minor);
> +	if (ret) {
> +		hid_hw_stop(hdev);
> +		return ret;
> +	}
> +
> +	hid_info(hdev, "U2F Zero LED initialised\n");
> +
> +	ret = u2fzero_init_hwrng(dev, minor);
> +	if (ret) {
> +		hid_hw_stop(hdev);
> +		return ret;
> +	}
> +
> +	hid_info(hdev, "U2F Zero RNG initialised\n");
> +
> +	return 0;
> +}

-- 
Cheers,
  Andrej
