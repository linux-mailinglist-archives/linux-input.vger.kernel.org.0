Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE6B92E7BF
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2019 00:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfE2WDk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 18:03:40 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45640 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfE2WDj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 18:03:39 -0400
Received: by mail-oi1-f196.google.com with SMTP id w144so3358815oie.12
        for <linux-input@vger.kernel.org>; Wed, 29 May 2019 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J0fouHvVvYOj3k99C7F02aA0NE1tmNkpIafaPrsWx84=;
        b=RgGlNjVoJ0c2GA/2yUWkJvWpWIHvOspWQ29fIGr4fyFJ+tQpf3/IVUGtD5KsdvdA7f
         YZL/ToDl1//4291FDXShvncDdmQrJuXSBZXcVxtUtq9pMfR82eV8Kl9DnRUI0Qr1m+UG
         rMo1n1fB31/Y3LwreIZ2RGijsKk1XqEYYrWR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0fouHvVvYOj3k99C7F02aA0NE1tmNkpIafaPrsWx84=;
        b=nkxlVPjtdJ4u/Oo77FDzE6jldrECpwmHU/qOQ4NwMaso8pjqv13pIkbb+EcO50AgJT
         ktQQdzPraR63VB+mGNpBrJh8pH1TLsb8pK9O/u0QrTqXf6330U1/Wg0+9Md/zKKiqNlD
         ZwpUIQVo+4Hh4iOmhnXym7TKJfNBUWmWikUz5lEO84UYfzN/S+B7SGWkQ8C2pE3a0Gfs
         jUzFoldhIv8yaemvfiaIttQmEaZDMlaT35zz0o7T+rf/TD7HiowEsfobs+qtBeZoJcRA
         UrAiZ67xILZ0VdodeKUDhGrWh0E/VGU0lz6TauGWTE2f56A6ORunT6PNTbUWCYPma45B
         BeeA==
X-Gm-Message-State: APjAAAW1iB98H1/0paIdWd80pCJ7N6W7ahRhoMvBHAuLt5Y77ukva/tc
        9ay0dZnaBv+/BUkJOFHUPjX9QFKUhZM=
X-Google-Smtp-Source: APXvYqxMUkI2oQtoV1vSEFg0pj4p+0Kr53ybloEbd7eMpW4Ub5UarKs+WVmAws+WnYPv/V/h9KfN7A==
X-Received: by 2002:aca:48c2:: with SMTP id v185mr333601oia.171.1559167418788;
        Wed, 29 May 2019 15:03:38 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id u8sm378328otk.53.2019.05.29.15.03.38
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 15:03:38 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id i8so3623723oth.10
        for <linux-input@vger.kernel.org>; Wed, 29 May 2019 15:03:38 -0700 (PDT)
X-Received: by 2002:a05:6830:8f:: with SMTP id a15mr39454oto.131.1559167417675;
 Wed, 29 May 2019 15:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <1559113257-19432-1-git-send-email-hyungwoo.yang@intel.com>
In-Reply-To: <1559113257-19432-1-git-send-email-hyungwoo.yang@intel.com>
From:   Jett Rink <jettrink@chromium.org>
Date:   Wed, 29 May 2019 16:03:26 -0600
X-Gmail-Original-Message-ID: <CAK+PMK7BseJPTe33a4nP+9G5A=xNxyC1_PUDSa+P7u_jPogHRw@mail.gmail.com>
Message-ID: <CAK+PMK7BseJPTe33a4nP+9G5A=xNxyC1_PUDSa+P7u_jPogHRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] HID: intel-ish-hid: fix wrong type conversion
To:     Hyungwoo Yang <hyungwoo.yang@intel.com>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        jikos@kernel.org, linux-input@vger.kernel.org,
        "Kadam, Rushikesh S" <rushikesh.s.kadam@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 29, 2019 at 1:01 AM Hyungwoo Yang <hyungwoo.yang@intel.com> wrote:
>
> Currently, in suspend() and resume(), ishtp client drivers are using
> driver_data to get "struct ishtp_cl_device" object which is set by
> bus driver. It's wrong since the driver_data should not be owned bus.
> driver_data should be owned by the corresponding ishtp client driver.
> Due to this, some ishtp client driver like cros_ec_ishtp which
> uses its driver_data doesn't work correctly.
>
> So instead of using driver_data to get "struct ishtp_cl_device", since
> "struct device" is embedded in "struct ishtp_cl_device", we introduce
> a helper function that uses container_of() method.
>
> Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
> ---
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c |  4 ++--
>  drivers/hid/intel-ish-hid/ishtp/bus.c        | 14 ++++++++++++++
>  drivers/platform/chrome/cros_ec_ishtp.c      |  4 ++--
>  include/linux/intel-ish-client-if.h          |  1 +
>  4 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> index 56777a4..19102a3 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> @@ -899,7 +899,7 @@ static int hid_ishtp_cl_reset(struct ishtp_cl_device *cl_device)
>   */
>  static int hid_ishtp_cl_suspend(struct device *device)
>  {
> -       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
>         struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
>         struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
>
> @@ -920,7 +920,7 @@ static int hid_ishtp_cl_suspend(struct device *device)
>   */
>  static int hid_ishtp_cl_resume(struct device *device)
>  {
> -       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
>         struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
>         struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
>
> diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
> index fb8ca12..5beea44 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/bus.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
> @@ -648,6 +648,20 @@ void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device)
>  EXPORT_SYMBOL(ishtp_get_drvdata);
>
>  /**
> + * ishtp_dev_to_cl_device() - get ishtp_cl_device instance from device instance
> + * @device: device instance
> + *
> + * Get ish_cl_device instance which embeds device instance in it.
> + *
> + * Return: pointer to ishtp_cl_device instance
> + */
> +struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *device)
> +{
> +       return container_of(device, struct ishtp_cl_device, dev);
Should we reuse to_ishtp_cl_device from the top of bus.c?


> +}
> +EXPORT_SYMBOL(ishtp_dev_to_cl_device);
> +
> +/**
>   * ishtp_bus_new_client() - Create a new client
>   * @dev:       ISHTP device instance
>   *
> diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
> index e504d25..430731c 100644
> --- a/drivers/platform/chrome/cros_ec_ishtp.c
> +++ b/drivers/platform/chrome/cros_ec_ishtp.c
> @@ -707,7 +707,7 @@ static int cros_ec_ishtp_reset(struct ishtp_cl_device *cl_device)
>   */
>  static int __maybe_unused cros_ec_ishtp_suspend(struct device *device)
>  {
> -       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
>         struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
>         struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
>
> @@ -722,7 +722,7 @@ static int __maybe_unused cros_ec_ishtp_suspend(struct device *device)
>   */
>  static int __maybe_unused cros_ec_ishtp_resume(struct device *device)
>  {
> -       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl_device *cl_device = ishtp_dev_to_cl_device(device);
>         struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
>         struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
>
> diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
> index 16255c2..0d6b4bc 100644
> --- a/include/linux/intel-ish-client-if.h
> +++ b/include/linux/intel-ish-client-if.h
> @@ -103,6 +103,7 @@ int ishtp_register_event_cb(struct ishtp_cl_device *device,
>  void ishtp_get_device(struct ishtp_cl_device *cl_dev);
>  void ishtp_set_drvdata(struct ishtp_cl_device *cl_device, void *data);
>  void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device);
> +struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *dev);
>  int ishtp_register_event_cb(struct ishtp_cl_device *device,
>                                 void (*read_cb)(struct ishtp_cl_device *));
>  struct ishtp_fw_client *ishtp_fw_cl_get_client(struct ishtp_device *dev,
> --
> 1.9.1
>
