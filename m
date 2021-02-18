Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A304531EC8E
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 17:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhBRQvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 11:51:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:55836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232743AbhBRNSS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 08:18:18 -0500
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E533E64EAD;
        Thu, 18 Feb 2021 13:17:35 +0000 (UTC)
Date:   Thu, 18 Feb 2021 13:17:32 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     jikos@kernel.org, srinivas.pandruvada@linux.intel.com,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] resolve read hystersis return invalid argument
 issue for hid sensors
Message-ID: <20210218131732.56f9f4bf@archlinux>
In-Reply-To: <20210201054921.18214-1-xiang.ye@intel.com>
References: <20210201054921.18214-1-xiang.ye@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon,  1 Feb 2021 13:49:19 +0800
Ye Xiang <xiang.ye@intel.com> wrote:

> This patch series move get sensitivity attribute to common layer and
> resolve read hystersis return invalid argument issue for hid sensors als,
> incli-3d, rotation, and press on intel ISH Platform.

Given Jiri was fine with the follow up series, I'm going to guess he
just missed this one and apply it with out his explicit ack.

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to see if they can find anything we missed.

Thanks,

Jonathan

> 
> ---
> v2:
>   - separate the add relative sensitivity patch to the next patch series.
> 
> Ye Xiang (2):
>   iio: hid-sensors: Move get sensitivity attribute to hid-sensor-common
>   hid-sensors: Add more data fields for sensitivity checking
> 
>  drivers/iio/accel/hid-sensor-accel-3d.c       | 23 ++++++-------
>  .../hid-sensors/hid-sensor-attributes.c       | 17 +++++++++-
>  drivers/iio/gyro/hid-sensor-gyro-3d.c         | 19 ++++-------
>  drivers/iio/humidity/hid-sensor-humidity.c    | 16 ++++------
>  drivers/iio/light/hid-sensor-als.c            | 20 +++++-------
>  drivers/iio/light/hid-sensor-prox.c           | 27 +++++-----------
>  drivers/iio/magnetometer/hid-sensor-magn-3d.c | 32 ++++++-------------
>  drivers/iio/orientation/hid-sensor-incl-3d.c  | 20 +++++-------
>  drivers/iio/orientation/hid-sensor-rotation.c | 24 ++++++--------
>  .../position/hid-sensor-custom-intel-hinge.c  | 20 ++++--------
>  drivers/iio/pressure/hid-sensor-press.c       | 20 +++++-------
>  .../iio/temperature/hid-sensor-temperature.c  | 16 ++++------
>  drivers/rtc/rtc-hid-sensor-time.c             |  4 ++-
>  include/linux/hid-sensor-hub.h                |  4 ++-
>  14 files changed, 111 insertions(+), 151 deletions(-)
> 

