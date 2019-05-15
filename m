Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95D1FC2D
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 23:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfEOVYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 17:24:21 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38073 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfEOVYV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 17:24:21 -0400
Received: by mail-qt1-f193.google.com with SMTP id d13so1497171qth.5;
        Wed, 15 May 2019 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4TahMLVa2tubbazYVw7C+5DzuIjjED5LZBS2XXxqTcA=;
        b=VFKyFFKToH/Y4Cm69EHX/DHAnvzmgEI6ASE3QVL/3rpC6FHYJpBwFoashmx2PrD6rJ
         11dOaGFWbvP3JY0+s1VNQd5UagWExpgpeaT5aSYgZj2ZEZ0PuDMRs4M1a6ztfi2IMDJ2
         DPun15QKJv+KMosi6i+N+3vZJPlUoT94wWdKVXoW6YgrMJPpJeKKFmvxanXFDDeSZyKX
         d+vpcnA1MCf4E+BQ0lHtK1OQZ44MN+4MBthPwx5UALnCS856t1NcsMRk25e7wg97zECQ
         lVsh6fHRhHC7penIspvk2h2cZuVyLeMC+crDTcMJ4mIefLL25ese+gS6RiUr99HlQcES
         HCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4TahMLVa2tubbazYVw7C+5DzuIjjED5LZBS2XXxqTcA=;
        b=USJO27Bo+rPGyNWEWRyo4nKztM+Hv0+lUDjdBHAUGBx7WuUUK4pV14d4Czo3mUW/MW
         4+4DyTA89T4rfC1OA9kLKDIPydfxVPytfpFKjRfkKKO7WjQG6ZpbT355rH87ENv34sUh
         5PluhmTEOSLunP8jNb4EWat4QW5JgYwoHLkU1FTaEXHapYhp4Ob5rT+9m1svMcr4SN+Z
         G93cMG7SeUIWNKzJG1nLyHYuH7EB2+VdA3C30ZccvJuGemyWI0AHj4bF4bzauO3IguxO
         O+rAdlMwm8zco5n1x5HP/iW18tgC5ZkdiNnSwMm+MCsGXISam5il7VpLq+9fkzCvAWqv
         84CQ==
X-Gm-Message-State: APjAAAUce8hhurmSH9G/+sbdBDyQKxNuVv21XeJAl6xDVgjN+Jz9M3kU
        oih/YYLVzJ+r+IMjMdNB5PQKt64Kb1PxWl/Enlb7dJ71
X-Google-Smtp-Source: APXvYqzwP2cdEaZM++ojnu5O6aZJvHrwtv79LJNJQhM5TfQphvIgbWYu7Itid29aze53xDI9OqxwWwnfsxnYkgEk7FM=
X-Received: by 2002:ac8:fa9:: with SMTP id b38mr34389458qtk.22.1557955458599;
 Wed, 15 May 2019 14:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <1557916721-31315-1-git-send-email-rushikesh.s.kadam@intel.com>
In-Reply-To: <1557916721-31315-1-git-send-email-rushikesh.s.kadam@intel.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 15 May 2019 23:24:07 +0200
Message-ID: <CAFqH_53omi9csPea5SsN15NOyzoWKtuYDBD2zD9ER4oF7K2Chg@mail.gmail.com>
Subject: Re: [PATCH v6] platform: chrome: Add ChromeOS EC ISHTP driver
To:     Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org, Nick Crews <ncrews@chromium.org>,
        Jett Rink <jettrink@chromium.org>,
        Gwendal Grignou <gwendal@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Missatge de Rushikesh S Kadam <rushikesh.s.kadam@intel.com> del dia
dc., 15 de maig 2019 a les 12:41:
>
> This driver implements a slim layer to enable the ChromeOS
> EC kernel stack (cros_ec) to communicate with ChromeOS EC
> firmware running on the Intel Integrated Sensor Hub (ISH).
>
> The driver registers a ChromeOS EC MFD device to connect
> with cros_ec kernel stack (upper layer), and it registers a
> client with the ISH Transport Protocol bus (lower layer) to
> talk with the ISH firwmare. See description of the ISHTP
> protocol at Documentation/hid/intel-ish-hid.txt
>
> Signed-off-by: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Jett Rink <jettrink@chromium.org>
> Tested-by: Jett Rink <jettrink@chromium.org>
> ---

The following patch is queued to the for-next branch for the autobuilders to
play with, if all goes well I'll add the patch for 5.3 when current merge window
closes.

Thanks,
 Enric

>
> Submitting the patch to linux-input@ per the discussion here
> https://lkml.org/lkml/2019/5/2/339
>
> The patch is baselined to hid git tree, branch for-5.2/ish
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-5.2/ish
>
> v6
>  - Moved the sanity checks in cros_ec_pkt_xfer_ish() to before
>    the point we take the lock (Bug fix).
>
> v5
>  - Submitting with all Acked-by & Tested-bys. No other changes.
>
> v4
>  - Coding style related changes. No functional changes. Addresses
>    review comments on v3.
>
> v3
>  - Made several changes to improve code readability. Replaced
>    multiple cl_data_to_dev(client_data) with dev variable. Use
>    reverse Xmas tree for variable defintion where it made sense.
>    Dropped few debug prints. Add docstring for function
>    prepare_cros_ec_rx().
>  - Fix code in function prepare_cros_ec_rx() under label
>    end_cros_ec_dev_init_error.
>  - Recycle buffer in process_recv() on failing to obtain the
>    semaphore.
>  - Increase ISHTP TX/RX ring buffer size to 8.
>  - Alphabetically ordered CROS_EC_ISHTP entries in Makefile and
>    Kconfig.
>  - Updated commit message.
>
> v2
>  - Dropped unused "reset" parameter in function cros_ec_init()
>  - Change driver name to cros_ec_ishtp to be consistent with other
>    references in the code.
>  - Fixed a few typos.
>
> v1
>  - Initial version
>
>  drivers/platform/chrome/Kconfig         |  13 +
>  drivers/platform/chrome/Makefile        |   1 +
>  drivers/platform/chrome/cros_ec_ishtp.c | 763 ++++++++++++++++++++++++++++++++
>  3 files changed, 777 insertions(+)
>  create mode 100644 drivers/platform/chrome/cros_ec_ishtp.c
>
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 16b1615..5848179 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -62,6 +62,19 @@ config CROS_EC_I2C
>           a checksum. Failing accesses will be retried three times to
>           improve reliability.
>
> +config CROS_EC_ISHTP
> +       tristate "ChromeOS Embedded Controller (ISHTP)"
> +       depends on MFD_CROS_EC
> +       depends on INTEL_ISH_HID
> +       help
> +         If you say Y here, you get support for talking to the ChromeOS EC
> +         firmware running on Intel Integrated Sensor Hub (ISH), using the
> +         ISH Transport protocol (ISH-TP). This uses a simple byte-level
> +         protocol with a checksum.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called cros_ec_ishtp.
> +
>  config CROS_EC_SPI
>         tristate "ChromeOS Embedded Controller (SPI)"
>         depends on MFD_CROS_EC && SPI
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index cd591bf..4efe102 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -7,6 +7,7 @@ cros_ec_ctl-objs                        := cros_ec_sysfs.o cros_ec_lightbar.o \
>                                            cros_ec_vbc.o cros_ec_debugfs.o
>  obj-$(CONFIG_CROS_EC_CTL)              += cros_ec_ctl.o
>  obj-$(CONFIG_CROS_EC_I2C)              += cros_ec_i2c.o
> +obj-$(CONFIG_CROS_EC_ISHTP)            += cros_ec_ishtp.o
>  obj-$(CONFIG_CROS_EC_SPI)              += cros_ec_spi.o
>  cros_ec_lpcs-objs                      := cros_ec_lpc.o cros_ec_lpc_reg.o
>  cros_ec_lpcs-$(CONFIG_CROS_EC_LPC_MEC) += cros_ec_lpc_mec.o
> diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
> new file mode 100644
> index 0000000..e504d25
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_ec_ishtp.c
> @@ -0,0 +1,763 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// ISHTP interface for ChromeOS Embedded Controller
> +//
> +// Copyright (c) 2019, Intel Corporation.
> +//
> +// ISHTP client driver for talking to the Chrome OS EC firmware running
> +// on Intel Integrated Sensor Hub (ISH) using the ISH Transport protocol
> +// (ISH-TP).
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/cros_ec.h>
> +#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/intel-ish-client-if.h>
> +
> +/*
> + * ISH TX/RX ring buffer pool size
> + *
> + * The AP->ISH messages and corresponding ISH->AP responses are
> + * serialized. We need 1 TX and 1 RX buffer for these.
> + *
> + * The MKBP ISH->AP events are serialized. We need one additional RX
> + * buffer for them.
> + */
> +#define CROS_ISH_CL_TX_RING_SIZE               8
> +#define CROS_ISH_CL_RX_RING_SIZE               8
> +
> +/* ISH CrOS EC Host Commands */
> +enum cros_ec_ish_channel {
> +       CROS_EC_COMMAND = 1,                    /* AP->ISH message */
> +       CROS_MKBP_EVENT = 2,                    /* ISH->AP events */
> +};
> +
> +/*
> + * ISH firmware timeout for 1 message send failure is 1Hz, and the
> + * firmware will retry 2 times, so 3Hz is used for timeout.
> + */
> +#define ISHTP_SEND_TIMEOUT                     (3 * HZ)
> +
> +/* ISH Transport CrOS EC ISH client unique GUID */
> +static const guid_t cros_ish_guid =
> +       GUID_INIT(0x7b7154d0, 0x56f4, 0x4bdc,
> +                 0xb0, 0xd8, 0x9e, 0x7c, 0xda, 0xe0, 0xd6, 0xa0);
> +
> +struct header {
> +       u8 channel;
> +       u8 status;
> +       u8 reserved[2];
> +} __packed;
> +
> +struct cros_ish_out_msg {
> +       struct header hdr;
> +       struct ec_host_request ec_request;
> +} __packed;
> +
> +struct cros_ish_in_msg {
> +       struct header hdr;
> +       struct ec_host_response ec_response;
> +} __packed;
> +
> +#define IN_MSG_EC_RESPONSE_PREAMBLE                                    \
> +       offsetof(struct cros_ish_in_msg, ec_response)
> +
> +#define OUT_MSG_EC_REQUEST_PREAMBLE                                    \
> +       offsetof(struct cros_ish_out_msg, ec_request)
> +
> +#define cl_data_to_dev(client_data) ishtp_device((client_data)->cl_device)
> +
> +/*
> + * The Read-Write Semaphore is used to prevent message TX or RX while
> + * the ishtp client is being initialized or undergoing reset.
> + *
> + * The readers are the kernel function calls responsible for IA->ISH
> + * and ISH->AP messaging.
> + *
> + * The writers are .reset() and .probe() function.
> + */
> +DECLARE_RWSEM(init_lock);
> +
> +/**
> + * struct response_info - Encapsulate firmware response related
> + * information for passing between function ish_send() and
> + * process_recv() callback.
> + *
> + * @data: Copy the data received from firmware here.
> + * @max_size: Max size allocated for the @data buffer. If the received
> + * data exceeds this value, we log an error.
> + * @size: Actual size of data received from firmware.
> + * @error: 0 for success, negative error code for a failure in process_recv().
> + * @received: Set to true on receiving a valid firmware        response to host command
> + * @wait_queue: Wait queue for host to wait for firmware response.
> + */
> +struct response_info {
> +       void *data;
> +       size_t max_size;
> +       size_t size;
> +       int error;
> +       bool received;
> +       wait_queue_head_t wait_queue;
> +};
> +
> +/**
> + * struct ishtp_cl_data - Encapsulate per ISH TP Client.
> + *
> + * @cros_ish_cl: ISHTP firmware client instance.
> + * @cl_device: ISHTP client device instance.
> + * @response: Response info passing between ish_send() and process_recv().
> + * @work_ishtp_reset: Work queue reset handling.
> + * @work_ec_evt: Work queue for EC events.
> + * @ec_dev: CrOS EC MFD device.
> + *
> + * This structure is used to store per client data.
> + */
> +struct ishtp_cl_data {
> +       struct ishtp_cl *cros_ish_cl;
> +       struct ishtp_cl_device *cl_device;
> +
> +       /*
> +        * Used for passing firmware response information between
> +        * ish_send() and process_recv() callback.
> +        */
> +       struct response_info response;
> +
> +       struct work_struct work_ishtp_reset;
> +       struct work_struct work_ec_evt;
> +       struct cros_ec_device *ec_dev;
> +};
> +
> +/**
> + * ish_evt_handler - ISH to AP event handler
> + * @work: Work struct
> + */
> +static void ish_evt_handler(struct work_struct *work)
> +{
> +       struct ishtp_cl_data *client_data =
> +               container_of(work, struct ishtp_cl_data, work_ec_evt);
> +       struct cros_ec_device *ec_dev = client_data->ec_dev;
> +
> +       if (cros_ec_get_next_event(ec_dev, NULL) > 0) {
> +               blocking_notifier_call_chain(&ec_dev->event_notifier,
> +                                            0, ec_dev);
> +       }
> +}
> +
> +/**
> + * ish_send() - Send message from host to firmware
> + *
> + * @client_data: Client data instance
> + * @out_msg: Message buffer to be sent to firmware
> + * @out_size: Size of out going message
> + * @in_msg: Message buffer where the incoming data is copied. This buffer
> + * is allocated by calling
> + * @in_size: Max size of incoming message
> + *
> + * Return: Number of bytes copied in the in_msg on success, negative
> + * error code on failure.
> + */
> +static int ish_send(struct ishtp_cl_data *client_data,
> +                   u8 *out_msg, size_t out_size,
> +                   u8 *in_msg, size_t in_size)
> +{
> +       int rv;
> +       struct header *out_hdr = (struct header *)out_msg;
> +       struct ishtp_cl *cros_ish_cl = client_data->cros_ish_cl;
> +
> +       dev_dbg(cl_data_to_dev(client_data),
> +               "%s: channel=%02u status=%02u\n",
> +               __func__, out_hdr->channel, out_hdr->status);
> +
> +       /* Setup for incoming response */
> +       client_data->response.data = in_msg;
> +       client_data->response.max_size = in_size;
> +       client_data->response.error = 0;
> +       client_data->response.received = false;
> +
> +       rv = ishtp_cl_send(cros_ish_cl, out_msg, out_size);
> +       if (rv) {
> +               dev_err(cl_data_to_dev(client_data),
> +                       "ishtp_cl_send error %d\n", rv);
> +               return rv;
> +       }
> +
> +       wait_event_interruptible_timeout(client_data->response.wait_queue,
> +                                        client_data->response.received,
> +                                        ISHTP_SEND_TIMEOUT);
> +       if (!client_data->response.received) {
> +               dev_err(cl_data_to_dev(client_data),
> +                       "Timed out for response to host message\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       if (client_data->response.error < 0)
> +               return client_data->response.error;
> +
> +       return client_data->response.size;
> +}
> +
> +/**
> + * process_recv() - Received and parse incoming packet
> + * @cros_ish_cl: Client instance to get stats
> + * @rb_in_proc: Host interface message buffer
> + *
> + * Parse the incoming packet. If it is a response packet then it will
> + * update per instance flags and wake up the caller waiting to for the
> + * response. If it is an event packet then it will schedule event work.
> + */
> +static void process_recv(struct ishtp_cl *cros_ish_cl,
> +                        struct ishtp_cl_rb *rb_in_proc)
> +{
> +       size_t data_len = rb_in_proc->buf_idx;
> +       struct ishtp_cl_data *client_data =
> +               ishtp_get_client_data(cros_ish_cl);
> +       struct device *dev = cl_data_to_dev(client_data);
> +       struct cros_ish_in_msg *in_msg =
> +               (struct cros_ish_in_msg *)rb_in_proc->buffer.data;
> +
> +       /* Proceed only if reset or init is not in progress */
> +       if (!down_read_trylock(&init_lock)) {
> +               /* Free the buffer */
> +               ishtp_cl_io_rb_recycle(rb_in_proc);
> +               dev_warn(dev,
> +                        "Host is not ready to receive incoming messages\n");
> +               return;
> +       }
> +
> +       /*
> +        * All firmware messages contain a header. Check the buffer size
> +        * before accessing elements inside.
> +        */
> +       if (!rb_in_proc->buffer.data) {
> +               dev_warn(dev, "rb_in_proc->buffer.data returned null");
> +               client_data->response.error = -EBADMSG;
> +               goto end_error;
> +       }
> +
> +       if (data_len < sizeof(struct header)) {
> +               dev_err(dev, "data size %zu is less than header %zu\n",
> +                       data_len, sizeof(struct header));
> +               client_data->response.error = -EMSGSIZE;
> +               goto end_error;
> +       }
> +
> +       dev_dbg(dev, "channel=%02u status=%02u\n",
> +               in_msg->hdr.channel, in_msg->hdr.status);
> +
> +       switch (in_msg->hdr.channel) {
> +       case CROS_EC_COMMAND:
> +               /* Sanity check */
> +               if (!client_data->response.data) {
> +                       dev_err(dev,
> +                               "Receiving buffer is null. Should be allocated by calling function\n");
> +                       client_data->response.error = -EINVAL;
> +                       goto error_wake_up;
> +               }
> +
> +               if (client_data->response.received) {
> +                       dev_err(dev,
> +                               "Previous firmware message not yet processed\n");
> +                       client_data->response.error = -EINVAL;
> +                       goto error_wake_up;
> +               }
> +
> +               if (data_len > client_data->response.max_size) {
> +                       dev_err(dev,
> +                               "Received buffer size %zu is larger than allocated buffer %zu\n",
> +                               data_len, client_data->response.max_size);
> +                       client_data->response.error = -EMSGSIZE;
> +                       goto error_wake_up;
> +               }
> +
> +               if (in_msg->hdr.status) {
> +                       dev_err(dev, "firmware returned status %d\n",
> +                               in_msg->hdr.status);
> +                       client_data->response.error = -EIO;
> +                       goto error_wake_up;
> +               }
> +
> +               /* Update the actual received buffer size */
> +               client_data->response.size = data_len;
> +
> +               /*
> +                * Copy the buffer received in firmware response for the
> +                * calling thread.
> +                */
> +               memcpy(client_data->response.data,
> +                      rb_in_proc->buffer.data, data_len);
> +
> +               /* Set flag before waking up the caller */
> +               client_data->response.received = true;
> +error_wake_up:
> +               /* Wake the calling thread */
> +               wake_up_interruptible(&client_data->response.wait_queue);
> +
> +               break;
> +
> +       case CROS_MKBP_EVENT:
> +               /* The event system doesn't send any data in buffer */
> +               schedule_work(&client_data->work_ec_evt);
> +
> +               break;
> +
> +       default:
> +               dev_err(dev, "Invalid channel=%02d\n", in_msg->hdr.channel);
> +       }
> +
> +end_error:
> +       /* Free the buffer */
> +       ishtp_cl_io_rb_recycle(rb_in_proc);
> +
> +       up_read(&init_lock);
> +}
> +
> +/**
> + * ish_event_cb() - bus driver callback for incoming message
> + * @cl_device: ISHTP client device for which this message is targeted.
> + *
> + * Remove the packet from the list and process the message by calling
> + * process_recv.
> + */
> +static void ish_event_cb(struct ishtp_cl_device *cl_device)
> +{
> +       struct ishtp_cl_rb *rb_in_proc;
> +       struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
> +
> +       while ((rb_in_proc = ishtp_cl_rx_get_rb(cros_ish_cl)) != NULL) {
> +               /* Decide what to do with received data */
> +               process_recv(cros_ish_cl, rb_in_proc);
> +       }
> +}
> +
> +/**
> + * cros_ish_init() - Init function for ISHTP client
> + * @cros_ish_cl: ISHTP client instance
> + *
> + * This function complete the initializtion of the client.
> + *
> + * Return: 0 for success, negative error code for failure.
> + */
> +static int cros_ish_init(struct ishtp_cl *cros_ish_cl)
> +{
> +       int rv;
> +       struct ishtp_device *dev;
> +       struct ishtp_fw_client *fw_client;
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +
> +       rv = ishtp_cl_link(cros_ish_cl);
> +       if (rv) {
> +               dev_err(cl_data_to_dev(client_data),
> +                       "ishtp_cl_link failed\n");
> +               return rv;
> +       }
> +
> +       dev = ishtp_get_ishtp_device(cros_ish_cl);
> +
> +       /* Connect to firmware client */
> +       ishtp_set_tx_ring_size(cros_ish_cl, CROS_ISH_CL_TX_RING_SIZE);
> +       ishtp_set_rx_ring_size(cros_ish_cl, CROS_ISH_CL_RX_RING_SIZE);
> +
> +       fw_client = ishtp_fw_cl_get_client(dev, &cros_ish_guid);
> +       if (!fw_client) {
> +               dev_err(cl_data_to_dev(client_data),
> +                       "ish client uuid not found\n");
> +               rv = -ENOENT;
> +               goto err_cl_unlink;
> +       }
> +
> +       ishtp_cl_set_fw_client_id(cros_ish_cl,
> +                                 ishtp_get_fw_client_id(fw_client));
> +       ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_CONNECTING);
> +
> +       rv = ishtp_cl_connect(cros_ish_cl);
> +       if (rv) {
> +               dev_err(cl_data_to_dev(client_data),
> +                       "client connect fail\n");
> +               goto err_cl_unlink;
> +       }
> +
> +       ishtp_register_event_cb(client_data->cl_device, ish_event_cb);
> +       return 0;
> +
> +err_cl_unlink:
> +       ishtp_cl_unlink(cros_ish_cl);
> +       return rv;
> +}
> +
> +/**
> + * cros_ish_deinit() - Deinit function for ISHTP client
> + * @cros_ish_cl: ISHTP client instance
> + *
> + * Unlink and free cros_ec client
> + */
> +static void cros_ish_deinit(struct ishtp_cl *cros_ish_cl)
> +{
> +       ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_DISCONNECTING);
> +       ishtp_cl_disconnect(cros_ish_cl);
> +       ishtp_cl_unlink(cros_ish_cl);
> +       ishtp_cl_flush_queues(cros_ish_cl);
> +
> +       /* Disband and free all Tx and Rx client-level rings */
> +       ishtp_cl_free(cros_ish_cl);
> +}
> +
> +/**
> + * prepare_cros_ec_rx() - Check & prepare receive buffer
> + * @ec_dev: CrOS EC MFD device.
> + * @in_msg: Incoming message buffer
> + * @msg: cros_ec command used to send & receive data
> + *
> + * Return: 0 for success, negative error code for failure.
> + *
> + * Check the received buffer. Convert to cros_ec_command format.
> + */
> +static int prepare_cros_ec_rx(struct cros_ec_device *ec_dev,
> +                             const struct cros_ish_in_msg *in_msg,
> +                             struct cros_ec_command *msg)
> +{
> +       u8 sum = 0;
> +       int i, rv, offset;
> +
> +       /* Check response error code */
> +       msg->result = in_msg->ec_response.result;
> +       rv = cros_ec_check_result(ec_dev, msg);
> +       if (rv < 0)
> +               return rv;
> +
> +       if (in_msg->ec_response.data_len > msg->insize) {
> +               dev_err(ec_dev->dev, "Packet too long (%d bytes, expected %d)",
> +                       in_msg->ec_response.data_len, msg->insize);
> +               return -ENOSPC;
> +       }
> +
> +       /* Copy response packet payload and compute checksum */
> +       for (i = 0; i < sizeof(struct ec_host_response); i++)
> +               sum += ((u8 *)in_msg)[IN_MSG_EC_RESPONSE_PREAMBLE + i];
> +
> +       offset = sizeof(struct cros_ish_in_msg);
> +       for (i = 0; i < in_msg->ec_response.data_len; i++)
> +               sum += msg->data[i] = ((u8 *)in_msg)[offset + i];
> +
> +       if (sum) {
> +               dev_dbg(ec_dev->dev, "Bad received packet checksum %d\n", sum);
> +               return -EBADMSG;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
> +                               struct cros_ec_command *msg)
> +{
> +       int rv;
> +       struct ishtp_cl *cros_ish_cl = ec_dev->priv;
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +       struct device *dev = cl_data_to_dev(client_data);
> +       struct cros_ish_in_msg *in_msg = (struct cros_ish_in_msg *)ec_dev->din;
> +       struct cros_ish_out_msg *out_msg =
> +               (struct cros_ish_out_msg *)ec_dev->dout;
> +       size_t in_size = sizeof(struct cros_ish_in_msg) + msg->insize;
> +       size_t out_size = sizeof(struct cros_ish_out_msg) + msg->outsize;
> +
> +       /* Sanity checks */
> +       if (in_size > ec_dev->din_size) {
> +               dev_err(dev,
> +                       "Incoming payload size %zu is too large for ec_dev->din_size %d\n",
> +                       in_size, ec_dev->din_size);
> +               return -EMSGSIZE;
> +       }
> +
> +       if (out_size > ec_dev->dout_size) {
> +               dev_err(dev,
> +                       "Outgoing payload size %zu is too large for ec_dev->dout_size %d\n",
> +                       out_size, ec_dev->dout_size);
> +               return -EMSGSIZE;
> +       }
> +
> +       /* Proceed only if reset-init is not in progress */
> +       if (!down_read_trylock(&init_lock)) {
> +               dev_warn(dev,
> +                        "Host is not ready to send messages to ISH. Try again\n");
> +               return -EAGAIN;
> +       }
> +
> +       /* Prepare the package to be sent over ISH TP */
> +       out_msg->hdr.channel = CROS_EC_COMMAND;
> +       out_msg->hdr.status = 0;
> +
> +       ec_dev->dout += OUT_MSG_EC_REQUEST_PREAMBLE;
> +       cros_ec_prepare_tx(ec_dev, msg);
> +       ec_dev->dout -= OUT_MSG_EC_REQUEST_PREAMBLE;
> +
> +       dev_dbg(dev,
> +               "out_msg: struct_ver=0x%x checksum=0x%x command=0x%x command_ver=0x%x data_len=0x%x\n",
> +               out_msg->ec_request.struct_version,
> +               out_msg->ec_request.checksum,
> +               out_msg->ec_request.command,
> +               out_msg->ec_request.command_version,
> +               out_msg->ec_request.data_len);
> +
> +       /* Send command to ISH EC firmware and read response */
> +       rv = ish_send(client_data,
> +                     (u8 *)out_msg, out_size,
> +                     (u8 *)in_msg, in_size);
> +       if (rv < 0)
> +               goto end_error;
> +
> +       rv = prepare_cros_ec_rx(ec_dev, in_msg, msg);
> +       if (rv)
> +               goto end_error;
> +
> +       rv = in_msg->ec_response.data_len;
> +
> +       dev_dbg(dev,
> +               "in_msg: struct_ver=0x%x checksum=0x%x result=0x%x data_len=0x%x\n",
> +               in_msg->ec_response.struct_version,
> +               in_msg->ec_response.checksum,
> +               in_msg->ec_response.result,
> +               in_msg->ec_response.data_len);
> +
> +end_error:
> +       if (msg->command == EC_CMD_REBOOT_EC)
> +               msleep(EC_REBOOT_DELAY_MS);
> +
> +       up_read(&init_lock);
> +
> +       return rv;
> +}
> +
> +static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
> +{
> +       struct cros_ec_device *ec_dev;
> +       struct device *dev = cl_data_to_dev(client_data);
> +
> +       ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
> +       if (!ec_dev)
> +               return -ENOMEM;
> +
> +       client_data->ec_dev = ec_dev;
> +       dev->driver_data = ec_dev;
> +
> +       ec_dev->dev = dev;
> +       ec_dev->priv = client_data->cros_ish_cl;
> +       ec_dev->cmd_xfer = NULL;
> +       ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
> +       ec_dev->phys_name = dev_name(dev);
> +       ec_dev->din_size = sizeof(struct cros_ish_in_msg) +
> +                          sizeof(struct ec_response_get_protocol_info);
> +       ec_dev->dout_size = sizeof(struct cros_ish_out_msg);
> +
> +       return cros_ec_register(ec_dev);
> +}
> +
> +static void reset_handler(struct work_struct *work)
> +{
> +       int rv;
> +       struct device *dev;
> +       struct ishtp_cl *cros_ish_cl;
> +       struct ishtp_cl_device *cl_device;
> +       struct ishtp_cl_data *client_data =
> +               container_of(work, struct ishtp_cl_data, work_ishtp_reset);
> +
> +       /* Lock for reset to complete */
> +       down_write(&init_lock);
> +
> +       cros_ish_cl = client_data->cros_ish_cl;
> +       cl_device = client_data->cl_device;
> +
> +       /* Unlink, flush queues & start again */
> +       ishtp_cl_unlink(cros_ish_cl);
> +       ishtp_cl_flush_queues(cros_ish_cl);
> +       ishtp_cl_free(cros_ish_cl);
> +
> +       cros_ish_cl = ishtp_cl_allocate(cl_device);
> +       if (!cros_ish_cl) {
> +               up_write(&init_lock);
> +               return;
> +       }
> +
> +       ishtp_set_drvdata(cl_device, cros_ish_cl);
> +       ishtp_set_client_data(cros_ish_cl, client_data);
> +       client_data->cros_ish_cl = cros_ish_cl;
> +
> +       rv = cros_ish_init(cros_ish_cl);
> +       if (rv) {
> +               ishtp_cl_free(cros_ish_cl);
> +               dev_err(cl_data_to_dev(client_data), "Reset Failed\n");
> +               up_write(&init_lock);
> +               return;
> +       }
> +
> +       /* Refresh ec_dev device pointers */
> +       client_data->ec_dev->priv = client_data->cros_ish_cl;
> +       dev = cl_data_to_dev(client_data);
> +       dev->driver_data = client_data->ec_dev;
> +
> +       dev_info(cl_data_to_dev(client_data), "Chrome EC ISH reset done\n");
> +
> +       up_write(&init_lock);
> +}
> +
> +/**
> + * cros_ec_ishtp_probe() - ISHTP client driver probe callback
> + * @cl_device: ISHTP client device instance
> + *
> + * Return: 0 for success, negative error code for failure.
> + */
> +static int cros_ec_ishtp_probe(struct ishtp_cl_device *cl_device)
> +{
> +       int rv;
> +       struct ishtp_cl *cros_ish_cl;
> +       struct ishtp_cl_data *client_data =
> +               devm_kzalloc(ishtp_device(cl_device),
> +                            sizeof(*client_data), GFP_KERNEL);
> +       if (!client_data)
> +               return -ENOMEM;
> +
> +       /* Lock for initialization to complete */
> +       down_write(&init_lock);
> +
> +       cros_ish_cl = ishtp_cl_allocate(cl_device);
> +       if (!cros_ish_cl) {
> +               rv = -ENOMEM;
> +               goto end_ishtp_cl_alloc_error;
> +       }
> +
> +       ishtp_set_drvdata(cl_device, cros_ish_cl);
> +       ishtp_set_client_data(cros_ish_cl, client_data);
> +       client_data->cros_ish_cl = cros_ish_cl;
> +       client_data->cl_device = cl_device;
> +
> +       init_waitqueue_head(&client_data->response.wait_queue);
> +
> +       INIT_WORK(&client_data->work_ishtp_reset,
> +                 reset_handler);
> +       INIT_WORK(&client_data->work_ec_evt,
> +                 ish_evt_handler);
> +
> +       rv = cros_ish_init(cros_ish_cl);
> +       if (rv)
> +               goto end_ishtp_cl_init_error;
> +
> +       ishtp_get_device(cl_device);
> +
> +       up_write(&init_lock);
> +
> +       /* Register croc_ec_dev mfd */
> +       rv = cros_ec_dev_init(client_data);
> +       if (rv)
> +               goto end_cros_ec_dev_init_error;
> +
> +       return 0;
> +
> +end_cros_ec_dev_init_error:
> +       ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_DISCONNECTING);
> +       ishtp_cl_disconnect(cros_ish_cl);
> +       ishtp_cl_unlink(cros_ish_cl);
> +       ishtp_cl_flush_queues(cros_ish_cl);
> +       ishtp_put_device(cl_device);
> +end_ishtp_cl_init_error:
> +       ishtp_cl_free(cros_ish_cl);
> +end_ishtp_cl_alloc_error:
> +       up_write(&init_lock);
> +       return rv;
> +}
> +
> +/**
> + * cros_ec_ishtp_remove() - ISHTP client driver remove callback
> + * @cl_device: ISHTP client device instance
> + *
> + * Return: 0
> + */
> +static int cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
> +{
> +       struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +
> +       cancel_work_sync(&client_data->work_ishtp_reset);
> +       cancel_work_sync(&client_data->work_ec_evt);
> +       cros_ish_deinit(cros_ish_cl);
> +       ishtp_put_device(cl_device);
> +
> +       return 0;
> +}
> +
> +/**
> + * cros_ec_ishtp_reset() - ISHTP client driver reset callback
> + * @cl_device: ISHTP client device instance
> + *
> + * Return: 0
> + */
> +static int cros_ec_ishtp_reset(struct ishtp_cl_device *cl_device)
> +{
> +       struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +
> +       schedule_work(&client_data->work_ishtp_reset);
> +
> +       return 0;
> +}
> +
> +/**
> + * cros_ec_ishtp_suspend() - ISHTP client driver suspend callback
> + * @device: device instance
> + *
> + * Return: 0 for success, negative error code for failure.
> + */
> +static int __maybe_unused cros_ec_ishtp_suspend(struct device *device)
> +{
> +       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +
> +       return cros_ec_suspend(client_data->ec_dev);
> +}
> +
> +/**
> + * cros_ec_ishtp_resume() - ISHTP client driver resume callback
> + * @device: device instance
> + *
> + * Return: 0 for success, negative error code for failure.
> + */
> +static int __maybe_unused cros_ec_ishtp_resume(struct device *device)
> +{
> +       struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +       struct ishtp_cl *cros_ish_cl = ishtp_get_drvdata(cl_device);
> +       struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
> +
> +       return cros_ec_resume(client_data->ec_dev);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cros_ec_ishtp_pm_ops, cros_ec_ishtp_suspend,
> +                        cros_ec_ishtp_resume);
> +
> +static struct ishtp_cl_driver  cros_ec_ishtp_driver = {
> +       .name = "cros_ec_ishtp",
> +       .guid = &cros_ish_guid,
> +       .probe = cros_ec_ishtp_probe,
> +       .remove = cros_ec_ishtp_remove,
> +       .reset = cros_ec_ishtp_reset,
> +       .driver = {
> +               .pm = &cros_ec_ishtp_pm_ops,
> +       },
> +};
> +
> +static int __init cros_ec_ishtp_mod_init(void)
> +{
> +       return ishtp_cl_driver_register(&cros_ec_ishtp_driver, THIS_MODULE);
> +}
> +
> +static void __exit cros_ec_ishtp_mod_exit(void)
> +{
> +       ishtp_cl_driver_unregister(&cros_ec_ishtp_driver);
> +}
> +
> +module_init(cros_ec_ishtp_mod_init);
> +module_exit(cros_ec_ishtp_mod_exit);
> +
> +MODULE_DESCRIPTION("ChromeOS EC ISHTP Client Driver");
> +MODULE_AUTHOR("Rushikesh S Kadam <rushikesh.s.kadam@intel.com>");
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("ishtp:*");
> --
> 1.9.1
>
