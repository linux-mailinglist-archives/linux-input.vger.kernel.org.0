Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACD91A2F21
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 08:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgDIGZV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 02:25:21 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43574 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgDIGZV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 02:25:21 -0400
IronPort-SDR: dafdDJP0RaCgHTSueUstCenKWbqFRbB0PqudBDEh2MYvT3x1ExYPGl0iqsyYR40BCWappZcPp2
 reRoFymGntKPCkzzHNbnyPfIlIrCc3D3GM1ZzTMykbrawrVnFwG3XP67furFSbp/1maZvNXDHa
 dAYvoHqByVa0fthr6eX7xwNyYHieAeiQhpiJEWgR72hmA1+4RBQAvBNU/A0yf8U2FAbK3bPpFN
 u81+3CkzCcmMhbNT1W0KWhkkKM37/oARxjQeqYlFKHdBm75oQSr/oHxuhFy3FE3pyi/YPf15lH
 zp0=
X-IronPort-AV: E=Sophos;i="5.72,361,1580803200"; 
   d="scan'208";a="47638267"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 08 Apr 2020 22:25:20 -0800
IronPort-SDR: Lz2cfuUitvx1f/tgahpSs/gQ+32w/hm4kADV5An3Z2mJRJ9YpyPaE1rRAi/T/J09G6uFZ+SuXY
 vgSvsrXTnmO6SilOyUgk7p/dB93o7t86C2Vmh5WopQiCjBX5J8f3izKTeuhoAis0vUI26AQiyr
 EpBv9b2QtsDRXVd75cNI16rILsQ8tgaQxeBghlBypdu0EGLAb+PXhiJ9OSgQzY0uGisqKOZ+d3
 TqekwoE+vhZa0uiGAMWvg8Kfi/g3PLXFMD3pPFUc+c4Cfr9ddSz5RNBJqFNW/wFN0pQxIp8tT6
 u9o=
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <Balasubramani_Vivekanandan@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
 <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
 <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
 <008d019c-2de7-4fe4-0c22-2668312f808b@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <5abe310f-094c-9355-d533-fb64efcbf726@mentor.com>
Date:   Thu, 9 Apr 2020 15:25:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <008d019c-2de7-4fe4-0c22-2668312f808b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/07 23:47, Dmitry Osipenko wrote:
> 07.04.2020 12:27, Wang, Jiada пишет:
> ..
>>> Is this a software (firmware) limitation which varies from version to
>>> version?
>>>
>>
>> the timeout issue trying to be addressed in this patch is from software,
>> one of our board a Serializer/Deserializer bridge exists between the SoC
>> (imx6) and the Atmel touch controller.
>> imx6 i2c controller driver has a timeout value(100ms) for each i2c
>> transaction,
>> Large i2c read transaction failed to complete within this timeout value
>> and therefore imx6 i2c controller driver aborts the transaction
>> and returns failure.
>>
>> Therefore this patch was created to split the large i2c transaction into
>> smaller chunks which can complete
>> within the timeout defined by i2c controller driver.
> 
> Isn't it possible to use the max_read/write_len of the generic struct
> i2c_adapter_quirks for limiting the transfer size?
> 
> BTW, it looks like the i.MX I2C driver doesn't specify the
> i2c_adapter_quirks, which probably needs to be fixed.
> 
yes, i.MX I2C driver can specify i2c_adapter_quirks to limit the size be 
transferred in one transaction.

But even in this case, mxt_process_messages_t44() fails when it tries to 
transfer data count larger than max_read/write_len set in i.MX I2C 
driver, which we would like to avoid.


Thanks,
Jiada

