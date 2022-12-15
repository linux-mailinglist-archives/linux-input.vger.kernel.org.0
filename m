Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5657064DC8A
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 14:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiLON4t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 08:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiLON4s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 08:56:48 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65C72F677
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 05:56:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m14so3110045wrh.7
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbemP1c6S3PEakTONQ8dO0tUgJCGKV85raRDtlD30Lk=;
        b=Hn3Esh0h2FM4H2DbBj0RLkKsjdbfrbvPiM5b9LTsPHoJ8CC4VxNPs2SOwj3n3/CkO8
         Y7lROIJ2jFHShoTW/nNUiB1UWFQEI5kEe8RBv7acWUWkokZNP0Vuud5LSOyE3lCfFciQ
         dl229GYl8VCKynv8IQcECNlTQYZcKWSYLjvXlw+AYZPxPIjVwDJzlVyIOm+q41iLWvF+
         VJZiBS/zPuVBJoBqOt6YJcdI5cbN/HtQXnlCf2SeUmw9U8H9/vBRcjoICpqO0ZpfLtdW
         opEQbBCrNnop5JRk6GBLidK4VMx8TLvUAFN06ArrkwF60lmXeY5ep9aKSfHASPD/nPD7
         vhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbemP1c6S3PEakTONQ8dO0tUgJCGKV85raRDtlD30Lk=;
        b=6oC0tHw/ArqusgnzgI2Q/HZEdMtkJVg1jFbn5wgII0TPc/flMpUA23acz8x6nGqkSO
         sFKMBrPSD65hS5kNvFQGI1TAb8WeMiDXsfazI5ZIMFd7K72kS4sgRR8pkycdxTh65bLt
         cTDXg/9NzCrosuYp+YjbgwTjjwBMhtKyv7qF9olRxvxdmkdFq8r6q+iAhaE9cxmp8Uiu
         IHWlzwqjUD7Yah9AzEmJrF4p7H8CUSkSVgQtRMN6NL7pSXTxP3YsUfkitUpgUTNFxoK/
         Bs9DNs4sesuY51XpjaiRKE18V0O/wgf1dUeSbGoDWnQoAgG7G2cGpDSsCQhmoy7vxeK9
         Cpdg==
X-Gm-Message-State: ANoB5pnOzWiC449wzWhrZWsAbSo+aw1/JGtagdqcizqSUomKbW9p+s1e
        7J/Ltu5PO7Ad/ly7vqlUsGaMb0zScY6A3LvZ
X-Google-Smtp-Source: AA0mqf5P2tkunak3bS2XNL7OX59u+kq+GMZEm0DiLTs5w4tAK9lVOQ9z9TmiVktzcBMvgjAva6qzGQ==
X-Received: by 2002:a5d:5608:0:b0:244:bfaf:d352 with SMTP id l8-20020a5d5608000000b00244bfafd352mr18416383wrv.12.1671112604999;
        Thu, 15 Dec 2022 05:56:44 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id ck12-20020a5d5e8c000000b0022584c82c80sm6224720wrb.19.2022.12.15.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 05:56:44 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
        eajames@linux.ibm.com, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: Re: [PATCH] Input: ibm-panel - fix typo in comment
In-Reply-To: <20221213194855.260-1-aldas60@gmail.com>
References: <20221213194855.260-1-aldas60@gmail.com>
Date:   Thu, 15 Dec 2022 14:56:43 +0100
Message-ID: <87wn6sixd0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 13, 2022 at 21:48, Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail=
.com> wrote:

> "set the index to it's largest possible value" -> "set the index to its
> largest possible value"
>
> Signed-off-by: Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/ibm-panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-pane=
l.c
> index a8fba0054..6be60bc8d 100644
> --- a/drivers/input/misc/ibm-panel.c
> +++ b/drivers/input/misc/ibm-panel.c
> @@ -101,7 +101,7 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *=
client,
>  		else
>  			/*
>  			 * The command is too long and therefore invalid, so set the index
> -			 * to it's largest possible value. When a STOP is finally received,
> +			 * to its largest possible value. When a STOP is finally received,
>  			 * the command will be rejected upon processing.
>  			 */
>  			panel->idx =3D U8_MAX;
> --=20
> 2.37.2
