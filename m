Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC2E1A4696
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 15:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJNAg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 09:00:36 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37615 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgDJNAg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 09:00:36 -0400
Received: by mail-lf1-f66.google.com with SMTP id t11so1315174lfe.4
        for <linux-input@vger.kernel.org>; Fri, 10 Apr 2020 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kB9c0/2P/FhcRzBE8yeggFOyrymXPvbeIOGWw8BM2GU=;
        b=OKaza5qVntHUspUXiHK60TpAgbZssnmtIhOfVHyxkqzyfO9QTB4XSrDsn1sX5mpdjl
         Nk8SpwbHWRxul5K60Xkhxl8kr8nyzlN6g/r4qwnvNDqnQj9vzIdYj/uLxSCvj5CiUy6E
         Yi5ze277+iKTsEg6OOYy+HMqkUYZ6JqSh0uEVGuTjL/q7dWCcQpfCW2cUjGoMSNDYI4T
         Nkba6xeXlQqF8OD5iNgOMrs0Yk1eudHNaHzFh8SFE2vtGgOmaViCNhfEDYMoVlIXs0DZ
         HBU2ajR2zGeM6IWXUqC5YWqM9K+zJ0zSj7N/3kgCPCx0ZImNLLcSEM8JBOBpBJw90LhK
         nFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kB9c0/2P/FhcRzBE8yeggFOyrymXPvbeIOGWw8BM2GU=;
        b=SqK36bsWTZRv4pTMrA88h1F0CE/HRpBiatOH+u2Rdlnv16CT1k8vxHX8X6U+iif3aI
         0uBrtOW494qIQIvzPBawxrHbGsZs86ORliHXZN/5Hps205vc8e6Jftvah4RrWjsirMfR
         Ce5viuszAFYzBaVCQvpI3AwoG2F9WnhTq0CtE3CvG5zqLEajiEZpISJugzb8bPmDKxy5
         7dkbNcQZQ4duHrJSTRUlGum8AsgWHBCSMf4qgHdiGwJRmhZ8EPVOomAmPoSDozWUW3UB
         F9RmUEomRPLWHnq9nn+dpPImn/XCDsr+/ex5RvOv3CnN7hJGyhW2T7eOEH0YrRAEG1Xt
         AmxA==
X-Gm-Message-State: AGi0PuZrfXWcUjc84i7Gv2mPW2lTDcBbJn1UuIaeYGBgPGJVMl5+1Twu
        RBKqsK/1zt6yb+sido2GwDBegXWeH+jC/7AiNEU=
X-Google-Smtp-Source: APiQypLNge3cgy1A2hJjxUqmMpoUz1z2yuHD3Z7Li3a/0BGhmCZKGUtL2OlN6rU8uOWm/rWGPMgNH3zIcbYSiID350U=
X-Received: by 2002:ac2:4113:: with SMTP id b19mr2562582lfi.70.1586523635275;
 Fri, 10 Apr 2020 06:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <1586522585-14296-1-git-send-email-haibo.chen@nxp.com> <1586522585-14296-2-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1586522585-14296-2-git-send-email-haibo.chen@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 10 Apr 2020 10:01:03 -0300
Message-ID: <CAOMZO5BS4ZLd9__xhf+66h_y2-totNF-B3Hh_evotd_MYPK57g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] input: egalax_ts: correct the get_firmware_command
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Haibo,

On Fri, Apr 10, 2020 at 9:51 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> According to the User Guide, the get firmware command is
> { 0x03, 0x03, 0xa, 0x01, 'D' }, ASCII value of 'D' is 0x44.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/input/touchscreen/egalax_ts.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
> index c816e03ba421..bb0a59d19f34 100644
> --- a/drivers/input/touchscreen/egalax_ts.c
> +++ b/drivers/input/touchscreen/egalax_ts.c
> @@ -171,10 +171,10 @@ static int egalax_wake_up_device(struct i2c_client *client)
>
>  static int egalax_firmware_version(struct i2c_client *client)
>  {
> -       static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x41 };
> +       static const u8 get_firmware_cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x44 };

The rename from 'cmd' to 'get_firmware_cmd' is an unrelated change.

The only change I would expect to see in this patch is 0x41 to 0x44.

Since this is bug fix, please add a Fixes tag.

Thanks
