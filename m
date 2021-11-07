Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740054472AB
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbhKGL1D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:27:03 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:33734 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234538AbhKGL07 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:26:59 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgGImjsKc; Sun, 07 Nov 2021 12:23:11 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284191; bh=/RtRMxLlau35AAxlbttJa46gfPKV9O1Mqz0UuIGedPw=;
        h=From;
        b=Z9tiAtDuV5Q65+jOl+8oZi9av8IuOlop/zGi5Z2X0QXf8n7EU3ZbzvKwS3hwwd77k
         dxWrLwVXfg/y0rhaHLiIJYky6AHI0/fc32gv9NdF0axqB/Hh7ApagIlnggZnAJOVuD
         xgjJpHl3XUi4sv0RyExh61MqHH0x5bonNX+q/1z3Dvulfi5ASo+p+SwLMXwPj8Lkof
         PLrGbsd5V0IHv4qQdfqEMIu536jrKg88l+w0Y7huoGgS6n0J2yu+xS2JmgqsqmjoLm
         xKyHjQqX9tFP2MgpzeEb0nIHk6RZQj0+hWUJ79tIwvgdmGsUcRbWiWN/PAYtCVWq5C
         fyLRDhqSY1I7Q==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b71f cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=nPkVdOmOLM6dsaJkhv8A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND PATCH 0/6] input: touchscreen: am335x: fix and improvements
Date:   Sun,  7 Nov 2021 12:22:30 +0100
Message-Id: <20211107112236.7969-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfA4yCIDbgDz2hxKRaYbsHXWwuq+27Sbp/kiUrM0D6sEbov7Zpae3hBc/u7Ost0HHukyUGoFz61rfCY54kdq6lf6AaEaHSbeul094xYv+SrOmb3PL6AUi
 tGLzOtU6hSwhvubFRPA2bpPZnjBRfleICDjeI761/YAKJOwi83WLXgt6aNofdAQW4oXdlfm7FjB1Hp/4tulvbhaLDh5WjO0/ux4dEgEmOkgoQZnXlazKOUHj
 nPIjVU37yU2Q2zKY/aJfcLhTfYCqjE6BdkmSBNUQmmWs06UafxmroE0yX1cHtV70Wa2oHcdDrfFPFgT1XkGhq/l1YpnMNBIBPlsmHDRmnDMa3qH2MCNOe39x
 NT/kkmQM9+cWAUMnOCoYnAHfXp2gCaTfsHp6OvFxSHsKw+wvKoVKmfqqUn+3+Z6uS3D/HmJ8Fv0BI3i+PV90u/nHiRmII1fhV/hwy7U0OUaNWdEtrUC1AFYX
 B10jh2sk2FgRrd2iFvDzTzkx1gzGa+kFhceFdA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


This series grew out of a touchscreen validation activity on a custom
board. Oscilloscope measurements and driver source analysis led to these
patches.

Added Rob Herring 'Acked-by' tag to commit "dt-bindings: input:
ti-tsc-adc: fix tsc node example".



Dario Binacchi (6):
  input: ti_am335x_tsc: set ADCREFM for X configuration
  input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
  input: ti_am335x_tsc: lower the X and Y sampling time
  dt-bindings: input: ti-tsc-adc: fix tsc node example
  mfd: ti_am335x_tscadc: fix reading a tsc property from DT
  mfd: ti_am335x_tscadc: drop the CNTRLREG_8WIRE macro

 .../bindings/input/touchscreen/ti-tsc-adc.txt  |  2 +-
 drivers/input/touchscreen/ti_am335x_tsc.c      | 18 +++++++++++++-----
 drivers/mfd/ti_am335x_tscadc.c                 |  7 ++++++-
 include/linux/mfd/ti_am335x_tscadc.h           |  1 -
 4 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.17.1

