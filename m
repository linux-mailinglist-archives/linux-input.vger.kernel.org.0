Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C44C12F8B0
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2020 14:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgACNMh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jan 2020 08:12:37 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33324 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgACNMg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jan 2020 08:12:36 -0500
Received: by mail-io1-f67.google.com with SMTP id z8so41279415ioh.0
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2020 05:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=30zoyA7P6Tv3skAoDZoq8xqN4o9iJa06FRbHK1Zh9ic=;
        b=DGJ6nh5/nf7PcSoztvP4CVhpVQb7hNYvrQZBRxdCB0AWSALZd+/ICTmeUaMSEb+yrw
         Vk/Z++sUZ2Nl+tDAzXYkqp4NODzCrJMqRgzsF7E3bjIgWWuocMtRfq7Ws8OeQyYooSYr
         goKkBVmJ+9WmO6Ov1n9/B12T2lXGA6u5bIr4BkTAa96IbfFQDh5r2IPMTbRXn/Ki5u6d
         vaZbt0Mmf18I3EafvXixEkiHZPCBo5yQrDJAlW+6CRo8S2zEyBcnErKwu8Fc0ATF8i5P
         jrH/hOVgna0BxsKEzxc1IZfv4/MwyO1Cc2/WAmtbYcCC+DuDDiv3BNltFmVHqAxy7ubB
         f4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=30zoyA7P6Tv3skAoDZoq8xqN4o9iJa06FRbHK1Zh9ic=;
        b=PhlyCYjU9DlBHjX/1MVqtmTAid2zyKoan8SdDUMqoHGyqQUgwsJu5BBPxtJIvlBs8l
         Ssk0bqC8Q92ArtwpoSblLjrq6PbgmSquxZiLxK4igVpepHG/DlN/XpXwAgsFxDPzJhzx
         FzqRUXNABKuBm4gkggJWCZI6UsbByDvb1BLgfhEXg33r9S5I3aZc9OEuKklmihdKExJC
         JutH/H2maVGQnCi4zWaLUWZsGhKDpDqNPcL15nJl9vLrkCV4hm3mHuEUygB1k7Ev3VCQ
         iyESSemvauzxo6Mw6s+7cJi8zdfZJs3aJ1gPa4dexzvbPiew9Sj5l6j0zNFpa7+GrNH5
         YngA==
X-Gm-Message-State: APjAAAXwya2G7M4+0xBDT0h/5aHhbGZ5iKcb27FfCrz0/ljJ7yMagQ+J
        rDQLA+HrMe91XtsGSncn+ON0QOxPoHdBNWcv0gJfUA==
X-Google-Smtp-Source: APXvYqy0pZUNAtl/Nu2tduflgj0dhUAGTOGl95cPZjOxBUjRtKp24RYctuGBbX6S2rM2LVnts2snudB1ZdXB3M5WsM0=
X-Received: by 2002:a05:6602:2352:: with SMTP id r18mr50032452iot.220.1578057155997;
 Fri, 03 Jan 2020 05:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20191210100753.11090-1-brgl@bgdev.pl>
In-Reply-To: <20191210100753.11090-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Jan 2020 14:12:25 +0100
Message-ID: <CAMRc=MfZmMV58kYD=bhuUCY0n3eb5iVy1kY=6NJsx6guagCd=Q@mail.gmail.com>
Subject: Re: [PATCH] input: max77650-onkey: add of_match table
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wt., 10 gru 2019 o 11:08 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We need the of_match table if we want to use the compatible string in
> the pmic's child node and get the onkey driver loaded automatically.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Gentle ping.

Bart
