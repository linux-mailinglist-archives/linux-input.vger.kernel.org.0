Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D87229925F
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 17:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1785924AbgJZQ1O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 26 Oct 2020 12:27:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59557 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1776154AbgJZQ1O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 12:27:14 -0400
Received: from mail-pf1-f199.google.com ([209.85.210.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kX5Kx-0002PC-Lt
        for linux-input@vger.kernel.org; Mon, 26 Oct 2020 16:27:11 +0000
Received: by mail-pf1-f199.google.com with SMTP id a12so5954096pfo.5
        for <linux-input@vger.kernel.org>; Mon, 26 Oct 2020 09:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bQNAGsZY4Zt77fe6g+6M4/9BKoxgHb3yhe7v/voJG7o=;
        b=pMV306TO0LLOWN8Lfco7sjnO63/0eOW/kGqHuTSP0+58QKCjstGZhAKAvHS/v1FqEs
         DtMy5II5zlHSLBVlplrHCdgijghBNAmGWICyv0iJGe3MgmVP9Vne4tdrRgH7MzBrB6i1
         JfIJfzLqECLS13LwfGIewalUqizBRpVX3yUFr+D7RI7ABNHoxQsg3+8eyqf5jT2mj3Zg
         kRlkggcz/xDlez/LfLWKmhLiSOYh+mzE8SdeEd2cFocqf+vujBZ5yJUmtoj4weKnmcyU
         FnnH1EZdeC/cdA4A/6TsoaSOL11GJtS6mkp2+SUo4Is/5y7l3PjiPVRGR4oVoeDqtVUh
         1MNA==
X-Gm-Message-State: AOAM532bIp3TUtOmvfEHStraADjKJT0/E/k5/wtsQ1axfqWgjJjp3Z1P
        d/gn3RN+lqoLuX1AcFXpTqAPiHA6TK/oERQhUkjUYy+n0v7JV/AVcC2o6dnWMb8oex/SgzMyFdo
        6NEl6roCvB0QDuDUWODI0Bor1H15nZSb1IZpwOfPm
X-Received: by 2002:a17:902:a407:b029:d2:2113:7f8f with SMTP id p7-20020a170902a407b02900d221137f8fmr12955661plq.70.1603729629821;
        Mon, 26 Oct 2020 09:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWDILhlDCJLIdg+Ti9AYC3s2XBiQwh32+pmiDNn6U1skSXV4/PQ1+MkBi7R+AL7/V0icfuHA==
X-Received: by 2002:a17:902:a407:b029:d2:2113:7f8f with SMTP id p7-20020a170902a407b02900d221137f8fmr12955618plq.70.1603729629430;
        Mon, 26 Oct 2020 09:27:09 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id c140sm12523718pfb.124.2020.10.26.09.27.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 09:27:08 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v2] HID: i2c-hid: Put ACPI enumerated devices in D3 on
 shutdown
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20201026154606.10409-1-hdegoede@redhat.com>
Date:   Tue, 27 Oct 2020 00:27:06 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <9A3982A8-D427-4284-9C29-8D71901B5FFA@canonical.com>
References: <20201026154606.10409-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> On Oct 26, 2020, at 23:46, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> The i2c-hid driver would quietly fail to probe the i2c-hid sensor-hub
> with an ACPI device-id of SMO91D0 every other boot.
> 
> Specifically, the i2c_smbus_read_byte() "Make sure there is something at
> this address" check would fail every other boot.
> 
> It seems that the BIOS does not properly reset/power-cycle the device
> leaving it in a confused state where it refuses to respond to i2c-xfers.
> On boots where probing the device failed, the driver-core puts the device
> in D3 after the probe-failure, which causes the probe to succeed the next
> boot.
> 
> Putting the device in D3 from the shutdown-handler fixes the sensors not
> working every other boot.
> 
> This has been tested on both a Lenovo Miix 2-10 and a Dell Venue 8 Pro 5830
> both of which use an i2c-hid sensor-hub with an ACPI id of SMO91D0.
> 
> Note that it is safe to call acpi_device_set_power() with a NULL pointer
> as first argument, so on none ACPI enumerated devices this change is a
> no-op.
> 
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

And I do wonder if we should do this for all ACPI devices...

Kai-Heng

> ---
> Changes in v2:
> -Rebase on 5.10-rc1
> ---
> drivers/hid/i2c-hid/i2c-hid-core.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 786e3e9af1c9..aeff1ffb0c8b 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -943,6 +943,11 @@ static void i2c_hid_acpi_enable_wakeup(struct device *dev)
> 	}
> }
> 
> +static void i2c_hid_acpi_shutdown(struct device *dev)
> +{
> +	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
> +}
> +
> static const struct acpi_device_id i2c_hid_acpi_match[] = {
> 	{"ACPI0C50", 0 },
> 	{"PNP0C50", 0 },
> @@ -959,6 +964,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
> static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
> 
> static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
> +
> +static inline void i2c_hid_acpi_shutdown(struct device *dev) {}
> #endif
> 
> #ifdef CONFIG_OF
> @@ -1175,6 +1182,8 @@ static void i2c_hid_shutdown(struct i2c_client *client)
> 
> 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> 	free_irq(client->irq, ihid);
> +
> +	i2c_hid_acpi_shutdown(&client->dev);
> }
> 
> #ifdef CONFIG_PM_SLEEP
> -- 
> 2.28.0
> 

