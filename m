Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C0758418
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2019 16:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfF0OCt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jun 2019 10:02:49 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42564 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF0OCt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jun 2019 10:02:49 -0400
Received: by mail-io1-f67.google.com with SMTP id u19so4919332ior.9;
        Thu, 27 Jun 2019 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HR741RRqebY4X1NTwNK+3TmEuWMGWvTRaUnu7N0KA9Y=;
        b=kQOe/7umXBPeJa9ykeZEkNlHWsfxFfLkKYMkY64foQTtgWh5Pn5wGsaEV8R3G7xvVU
         VXi6o6+TMpMPZeN657TfKrJBZkj+WOLSXs+PljDAivCvu1MvuvTjJp44an05YG1s3+wm
         lMHQ7mG1vbB1/iw1m6y+xvJof+L3lWTcbAPMj8lZVbCVFh4s7KkXBxjhtJM3/2TweT6f
         hOxilAJt7U7zgg5kka0w62aA9HESs4SouVmSIUrnTX51QqtBA7rUbDkIxcTk+2ZYqv9G
         UJLA5aM93V/QXZnQIPSrtebobY8K4dhtV00po57j8+wbUtFqyd0INos5iKeUXC8lzZws
         tlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HR741RRqebY4X1NTwNK+3TmEuWMGWvTRaUnu7N0KA9Y=;
        b=IKzgZILG3uRRjEHK0q3fTKTh22MV38yo+PBzLs4/H/bJru3CSRBFXe/eJisNgcyz0h
         0QNzBVnx/t2MnaIpANPQhTjgg8Rx6462ZR83RFm20PHDkg98FWcfqsDozqpQBGZCfD5t
         sX03uSxy4RUxx/HrJjdtHY/3XEV/qXtgcaLxfuvp8J3d8ZHSTzTq3poUBk/RTmzi+nqs
         vm9nyEaSEvLMoLW/JMuaT71FiMFt0l5GT0uDzX4PC8oO/HewGVMTJjwyJGEGlhh4rhPz
         Lhcs4ZrD+PxnYnZYDr8y5GzVU4zpSPu7IkXuqyPHAJkIn+bgFe+HchQww3VVdL0JJUUo
         HdwQ==
X-Gm-Message-State: APjAAAWQOv5qsGsutc81L2+4wYPP3oqm0f7v7U4vyBQ3nqZrTlWEcHcN
        RL3h2Kfxd5BW44q/f5VSm3AJ0o3FrNddHXVBLBo=
X-Google-Smtp-Source: APXvYqwxq6k8RM7mKSu7KdFaK3htzOTQ92YdpSzmLBI9AfAIpQYhG+2uj4SJJnP2pUHa9ePz7ETa8nCeNSjch6xgYEI=
X-Received: by 2002:a6b:e615:: with SMTP id g21mr1197927ioh.178.1561644168258;
 Thu, 27 Jun 2019 07:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145042.38637-1-jeffrey.l.hugo@gmail.com> <20190623062000.GB204275@dtor-ws>
In-Reply-To: <20190623062000.GB204275@dtor-ws>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 27 Jun 2019 08:02:35 -0600
Message-ID: <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 23, 2019 at 12:20 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Jun 21, 2019 at 07:50:42AM -0700, Jeffrey Hugo wrote:
> > Elan_i2c and hid-quirks work in conjunction to decide which devices each
> > driver will handle.  Elan_i2c has a whitelist of devices that should be
> > consumed by hid-quirks so that there is one master list of devices to
> > handoff between the drivers.  Put the ids in a header file so that
> > hid-quirks can consume it instead of duplicating the list.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>
> Benjamin, are you happy with this version?

Benjamin, ping?
Sorry to be a bother, but I'm still anxious to get this queued for 5.3.
