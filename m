Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6FBE5A50
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2019 13:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfJZLyj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Oct 2019 07:54:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45573 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfJZLyj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Oct 2019 07:54:39 -0400
Received: by mail-io1-f66.google.com with SMTP id c25so5403734iot.12
        for <linux-input@vger.kernel.org>; Sat, 26 Oct 2019 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=95NF6ya59NaDwQCRMTuT7+DIGgKDYS13smU5I7TrWOE=;
        b=qCUMmIo0BbhCOq9lMzlReiKmqepVYdzM2YHifoI12iUkwr37TnSbvdjsnrTHq6ddmv
         bcNdWTRhsJCrcu7H+ZCbftfrVYkGrejXQxUsYqr0QnOt1tpYtB5fhjD+VdHrd1I4JVAH
         6A1H7nzmZSFyJykoe7ZXgjzmD1QlscU7jWstKtx1hQb0yQV1NCvVZmzgvp6XTgkrdojg
         BUcQh6tjpP7wwpI4YysReDIgQl3n2hB2IrwEpkfFIoVP4NOpQ/5bmGbGDqSwfXcn28+A
         cYAAqbFjVBQV/Ld6TFnMXKFf1zfkBRNDH5cO8RBSUUt6TuGkDcW+xW9PSAQ/48drX/SD
         eXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=95NF6ya59NaDwQCRMTuT7+DIGgKDYS13smU5I7TrWOE=;
        b=qS0qKsn5scx9jmkKf2rbeYxpYC9TIc8fQQP49LmjqsbolWYMcELd2OO9gTpeILjsNu
         r8m/xsPsk0gdA3kzmVlDC3aqhjfr1gQ7Axsp9AUazM86G1V5hpv0PfZI3hGIH7aNRO/b
         NDJsXPyHqdHCgGgLd4Ra9p6TcUAkQIP2Ua/EZCpUc1pOZKsWikbyXuhYRMM9jbcvTUq7
         3fI7h2uCFT3IjQJAbsDZUUTHFStDR9LE4f+naTWF+usfsk4jQ4Lxf8tqilyXnDrhSS88
         TwogPWl6u4HVS7Wy4XfhWy5k+L9bzRI309+m2oscH2L2OcKid1QKRZZe8cNl41/vTfyw
         +6gg==
X-Gm-Message-State: APjAAAU7Bo3g9O3pBYPeUsP524qVp5+80VyJJPU33ACTp/S3jirbFZxc
        z6VsDSZuL4X0XCp3HWRySJlo0ywK/zOixQG3T6UTUQ==
X-Google-Smtp-Source: APXvYqxZwvpfOq9dYpYH92DZtvwRF1oK54mc+XbTMo9ELET5163QFqgxXpr4ovIlOhCTlZMuVH2hrmtKW1p9kGU4FRk=
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr6377672ioc.189.1572090877362;
 Sat, 26 Oct 2019 04:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191021124428.2541-1-brgl@bgdev.pl>
In-Reply-To: <20191021124428.2541-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 26 Oct 2019 13:54:26 +0200
Message-ID: <CAMRc=MeYS+rQMCEc_z1FudnremUhUsXnxdcB2heF6qdtOkH9uQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] dt-bindings: max77650: convert the device-tree
 bindings to yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 14:44 Bartosz Golaszewski <brgl@bgdev.pl> napisa=
=C5=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series converts all DT binding documents for MAX77650 PMIC to YAML.
>
> v1 -> v2:
> - use upper case for abbreviations in commit messages
>
> v2 -> v3:
> - pull all example fragments into the binding document for the core MFD m=
odule
> - fix all dt_binding_check errors
> - add references to submodules to the main binding document
> - drop the type for gpio-line-names
> - drop the description for the interrupts property
> - completely delete the previous txt files
>
> v3 -> v4:
> - remove unnecessary parts of descriptions, added details on the chip
> - correct file references (.txt -> .yaml)
> - fix mixing scalar and array constraints
> - dropped type refs for globally defined properties
>
> Bartosz Golaszewski (6):
>   dt-bindings: input: max77650: convert the binding document to yaml
>   dt-bindings: regulator: max77650: convert the binding document to yaml
>   dt-bindings: power: max77650: convert the binding document to yaml
>   dt-bindings: leds: max77650: convert the binding document to yaml
>   dt-bindings: mfd: max77650: convert the binding document to yaml
>   MAINTAINERS: update the list of maintained files for max77650
>
>  .../bindings/input/max77650-onkey.txt         |  26 ---
>  .../bindings/input/max77650-onkey.yaml        |  35 ++++
>  .../bindings/leds/leds-max77650.txt           |  57 -------
>  .../bindings/leds/leds-max77650.yaml          |  51 ++++++
>  .../devicetree/bindings/mfd/max77650.txt      |  46 ------
>  .../devicetree/bindings/mfd/max77650.yaml     | 149 ++++++++++++++++++
>  .../power/supply/max77650-charger.txt         |  28 ----
>  .../power/supply/max77650-charger.yaml        |  34 ++++
>  .../bindings/regulator/max77650-regulator.txt |  41 -----
>  .../regulator/max77650-regulator.yaml         |  31 ++++
>  MAINTAINERS                                   |   4 +-
>  11 files changed, 302 insertions(+), 200 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/max77650-onke=
y.txt
>  create mode 100644 Documentation/devicetree/bindings/input/max77650-onke=
y.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.=
txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.=
yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77650.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/power/supply/max776=
50-charger.txt
>  create mode 100644 Documentation/devicetree/bindings/power/supply/max776=
50-charger.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max77650-=
regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77650-=
regulator.yaml
>
> --
> 2.23.0
>

Hi Rob,

thanks for reviewing the series. Can you please take it through your
tree for v5.5? I think it'll be easier than bothering all the
respective maintainers and it only touches on bindings anyway.

Thanks,
Bartosz
