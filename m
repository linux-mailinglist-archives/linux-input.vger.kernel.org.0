Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B121BA697
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 16:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgD0Oin (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 10:38:43 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.4]:42175 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgD0Oin (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 10:38:43 -0400
Received: from [100.113.0.171] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 82/AC-37389-07EE6AE5; Mon, 27 Apr 2020 14:38:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsVy8MN7Xd38d8v
  iDC40GlrMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzdi4IqLgB3vF9oNrmRsYP7N2MXJxCAmsZZRoaGph6W
  LkBHIqJTZ+n8AKYvMKmEo82LaSHcRmE9CReDRzPROIzSKgKnF68S6gGg4OYQEriZlnTEHmiAi
  cZpZ4136eDcRhFpjGKLHn42FmiEGCEidnPgFbwCwgIXHwxQtmiGVaEufWrGKcwMg9C0nZLCRl
  CxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrrWljoJVbpJuqlluomp+aVFCUCJfUSy4v1iitzk
  3NS9PJSSzYxAkM+pZA5YgfjtbXv9Q4xSnIwKYnynly9LE6ILyk/pTIjsTgjvqg0J7X4EKMMB4
  eSBC/7W6CcYFFqempFWmYOMP5g0hIcPEoivNdA0rzFBYm5xZnpEKlTjLoc19/vXcosxJKXn5c
  qJc67FqRIAKQoozQPbgQsFVxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrBzKFJzOvBG7T
  K6AjmICOqJJfDHJESSJCSqqBKeTVVGWvYM03KpsSj9zlkgqoKvi5jiPSkvfmuqkZLaZnP1+68
  8PJZVGliFOycbnCiiKtvXu+2Tv0ZRWaBz3JaGz32C/3NbbmuLRgwaaAu4r/10df3rS4xV462C
  xc6FXRQr2Vh4KO5Nz8/znf+f0hvtTXKf/uHkw5VbZtp7b+bLX8m5Lpl8snn9M88eoTn9H6j6v
  C7E/OWfh2y4Fl84vrpMr47Vzi/Xzv/ORlXvhEJ+J78I4Nk17bdc65MYl1FdfZF9dKtFU8ZAXW
  S1w64pge8unpC+f2lxcU4tn7E/a3hRuFb5qYxKMUIi5ymmudlvk3QcvmO+ufCP57srZHYk5S+
  72Co902e3dPKXVjPiK5R4mlOCPRUIu5qDgRALJcNUKAAwAA
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-9.tower-223.messagelabs.com!1587998319!3025129!1
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12827 invoked from network); 27 Apr 2020 14:38:39 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-9.tower-223.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 27 Apr 2020 14:38:39 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Mon, 27 Apr 2020 16:38:37 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 76F9113F671; Mon, 27 Apr 2020 23:38:36 +0900 (KST)
Message-ID: <cover.1587975654.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 27 Apr 2020 17:20:54 +0900
Subject: [PATCH V12 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH V11 1/3] MAINTAINERS file update for DA7280
[PATCH V11 2/3] DA7280 DT Binding
[PATCH V11 3/3] DA7280 Driver

This patch applies against linux-next and v5.7-rc2

Thank you,
Roy Im, Dialog Semiconductor Ltd.

Roy Im (3):
  MAINTAINERS: da7280 updates to the Dialog Semiconductor search terms
  dt-bindings: input: Add document bindings for DA7280
  Input: new da7280 haptic driver

 .../devicetree/bindings/input/dlg,da7280.txt       |  109 ++
 MAINTAINERS                                        |    2 +
 drivers/input/misc/Kconfig                         |   13 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/da7280.c                        | 1898 ++++++++++++++++++++
 5 files changed, 2023 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH V12

