Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AB72C5D82
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 22:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732043AbgKZVag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 16:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgKZVag (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 16:30:36 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA95AC0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 13:30:34 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so2591402pgg.13
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=vsUccNkEE3/MpV2gRP6G1i+rVTxtLBeu2FDu1ITezIk=;
        b=z3FMXEW0lQi3ZOvb+Qi0/VYBp+KA4DVC25yDFweTbSgmBYMAhffisNrcayjfTK6o+2
         vtLjXZ8+PGld3G8i8lHWP8bQ9NSvPw3ze/he67NY61kURuYQzQQV0C54QEWH2gaZPN0T
         DOlSrpQfnNvFoBPGCRPkBjbYWOCdA2on2aC61QzM8Va1YhjjQ0WuSjJP+0g+2x0Y25mX
         JT9SqM/5k0vgYjKqCFfpxH6Br4xWiy8OGf8p+pCSxU+8uyw34oswDfR43sI9d8sypYgE
         fhDtcx/CWzub68ycBJsirW0AE2bEDzMhtPRR62po+igQpepvrVUR3lSb62wDFw2iEMHi
         n1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vsUccNkEE3/MpV2gRP6G1i+rVTxtLBeu2FDu1ITezIk=;
        b=HCnyjS33GUN/DOuAzNQVPqhqEirtCuL4TjRt3VRFdU4/9jJNXOca958KrBVv13LTEA
         WZmXbEZEpuAzbFYn9FOiBJTscpLxeHjhvYIfkZ0mY/f+toS34gx3rk4fILiPsc5Uzkwc
         /DDAbpWMcfcZxH75B1gDJZpEGztV7i3QmVL0uHTJK0lWK7h5aMsOBUu29RVpk5MjlDlt
         B9GTQJJSW7YJRqgrANpqosIdlLs3vJ5PDYJQ/YqtRT9RWblPsjloftbRDd/9uZVnAteA
         9rmhsOkNek8e5XjQSV7vReru3ICVm/d8BmmKMMc6u82e3QJirqRhUgJTfauQgBCOVDSp
         K0kg==
X-Gm-Message-State: AOAM533K5vwzI3cQRUtq+iyDdMoeYVrhA4l8SxqQKhSySPgtE8aXuzDR
        LrZhvesPwSi4nbocdH0X4P6kDYSKf0Pdk71r
X-Google-Smtp-Source: ABdhPJxBlhPKUNc2uJgqlkmC0ajE2FFY1IWTy44iLvqkssT/A8i1vhwlZzvbyRe0TMC6ljp1SVk8QA==
X-Received: by 2002:a63:ec16:: with SMTP id j22mr1111430pgh.332.1606426234196;
        Thu, 26 Nov 2020 13:30:34 -0800 (PST)
Received: from [10.0.0.4] (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.gmail.com with ESMTPSA id z10sm5483423pfa.149.2020.11.26.13.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 13:30:33 -0800 (PST)
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
 <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
From:   Dean Camera <dean@fourwalledcubicle.com>
Message-ID: <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
Date:   Fri, 27 Nov 2020 08:30:28 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

Comments inline.

- Dean

On 27/11/2020 6:05 am, Filipe Laíns wrote:
> Hi,
> 
> What is the difference between V1, V2 and V3? I think generally you would add a
> small summary.
> 

Sorry, that's my fault -- the contents are identical. I am more used to 
modern tooling with code review platforms, pull-requests or even emailed 
attached patches, so the old tooling took me a few goes to get right.

V1 was mangled by Thunderbird, while V2 was missing the cover letter 
when I submitted it via git send-email from my test machine. V3 is where 
I (think) I beat the tooling into submission.

> 
> On Thu, 2020-11-26 at 09:39 +1100, Dean Camera wrote:
>> Currently the hidraw module can only read and write feature HID
>> reports on demand, via dedicated ioctls. Input reports are read
>> from the device through the read() interface, while output reports
>> are written through the write interface().
>>
>> This is insufficient; it is desirable in many situations to be
>> able to read and write input and output reports through the
>> control interface to cover additional scenarios:
>>    - Reading an input report by its report ID, to get initial state
>>    - Writing an input report, to set initial input state in the device
>>    - Reading an output report by its report ID, to obtain current state
>>    - Writing an output report by its report ID, out of band
>>
>> This patch adds these missing ioctl requests to read and write
>> the remaining HID report types. Note that not all HID backends will
>> neccesarily support this (e.g. while the USB link layer supports
>> setting Input reports, others may not).
>>
>> Also included are documentation and example updates. The current
>> hidraw documentation states that feature reports read from the
>> device does *not* include the report ID, however this is not the
>> case and the returned report will have its report ID prepended
>> by conforming HID devices, as the report data sent from the device
>> over the control endpoint must be indentical in format to those
>> sent over the regular transport.
>>
>> Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>
>> ---
>>   Documentation/hid/hidraw.rst | 45 ++++++++++++++++++++++++++++++++++--
>>   drivers/hid/hidraw.c         | 24 ++++++++++++++++++-
>>   include/uapi/linux/hidraw.h  |  6 +++++
>>   samples/hidraw/hid-example.c |  2 +-
>>   4 files changed, 73 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/hid/hidraw.rst b/Documentation/hid/hidraw.rst
>> index 4a4a0ba1f362..f41c1f0f6252 100644
>> --- a/Documentation/hid/hidraw.rst
>> +++ b/Documentation/hid/hidraw.rst
>> @@ -123,8 +123,49 @@ HIDIOCGFEATURE(len):
>>   This ioctl will request a feature report from the device using the control
>>   endpoint.  The first byte of the supplied buffer should be set to the report
>>   number of the requested report.  For devices which do not use numbered
>> -reports, set the first byte to 0.  The report will be returned starting at
>> -the first byte of the buffer (ie: the report number is not returned).
>> +reports, set the first byte to 0.  The returned report buffer will contain
>> the
>> +report number in the first byte, followed by the report data read from the
>> +device.  For devices which do not use numbered reports, the report data will
>> +begin at the first byte of the returned buffer.
>> +
>> +HIDIOCSINPUT(len):
>> +       Send an Input Report
>> +
>> +This ioctl will send an input report to the device, using the control
>> endpoint.
>> +In most cases, setting an input HID report on a device is meaningless and has
>> +no effect, but some devices may choose to use this to set or reset an initial
>> +state of a report.  The format of the buffer issued with this report is
>> identical
>> +to that of HIDIOCSFEATURE.
>> +
>> +HIDIOCGINPUT(len):
>> +       Get an Input Report
>> +
>> +This ioctl will request an input report from the device using the control
>> +endpoint.  This is slower on most devices where a dedicated In endpoint
>> exists
>> +for regular input reports, but allows the host to request the value of a
>> +specific report number.  Typically, this is used to request the initial
>> states of
>> +an input report of a device, before an application listens for normal reports
>> via
>> +the regular device read() interface.  The format of the buffer issued with
>> this report
>> +is identical to that of HIDIOCGFEATURE.
> 
> I am not sure using the same approach as HIDIOCGFEATURE is a good design choice.
> The first byte of the supplied buffer is the report ID, but you can set is to 0
> if you don't want to use numbered reports. From my understanding, this makes it
> impossible to use the ioctl with report ID 0, which valid per the HID spec.
> 

Report ID 0 is reserved by the HID specification and may not be used in 
a device with multiple reports (see "Device Class Definition for HID 
1.11", section "6.2.2.7 Global Items" where it states "Report ID zero is 
reserved and should not be used.").

I think the designers of HID forsaw a sane future where in userspace 
everyone just assumed the report ID was present at all times, and the 
HID driver would just omit it on the wire if it was zero. Unfortunatly 
every platform seems to handle that differently now, with some always 
requring it, and others selectively omitting it in their APIs.

> My suggestion would be to automatically use numbered reports or not depending if
> the device uses them. A HID endpoint either uses numbered reports or not, it
> doesn't make much sense to me to let users try to use numbered reports on
> devices that do not use them or the other way round.
> 
> But I guess this is a question for Benjamin.

I'm *strongly* in favour of always having them at least in the 
`ioctl()`, with a (reserved) zero value indicating it is unused - like 
it is now. That makes userspace easier to deal with, and covers the 
quirk case where a device does not list report IDs in its HID report 
descriptor properly, but requires them anyway.

It also makes the new requests consistent with the existing request, so 
there's no extra cognitive load from working with one then switching to 
the others.

> 
> I tried to track down the discussion about the addition of the HIDIOCGFEATURE
> ioctl but from what I saw there was no mention of this design flaw.
> 
> Am I missing something here?
> 
>> +HIDIOCSOUTPUT(len):
>> +       Send an Output Report
>> +
>> +This ioctl will send an output report to the device, using the control
>> endpoint.
>> +This is slower on most devices where a dedicated Out endpoint exists for
>> regular
>> +output reports, but is added for completeness.  Typically, this is used to
>> set
>> +the initial states of an output report of a device, before an application
>> sends
>> +updates via the regular device write() interface. The format of the buffer
>> issued
>> +with this report is identical to that of HIDIOCSFEATURE.
>> +
>> +HIDIOCGOUTPUT(len):
>> +       Get an Output Report
>> +
>> +This ioctl will request an output report from the device using the control
>> +endpoint.  Typically, this is used to retrive the initial state of
>> +an output report of a device, before an application updates it as necessary
>> either
>> +via a HIDIOCSOUTPUT request, or the regular device write() interface.  The
>> format
>> +of the buffer issued with this report is identical to that of HIDIOCGFEATURE.
>>   
>>   Example
>>   -------
>> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
>> index 2eee5e31c2b7..79faac87a06f 100644
>> --- a/drivers/hid/hidraw.c
>> +++ b/drivers/hid/hidraw.c
>> @@ -170,7 +170,7 @@ static ssize_t hidraw_write(struct file *file, const char
>> __user *buffer, size_t
>>   /*
>>    * This function performs a Get_Report transfer over the control endpoint
>>    * per section 7.2.1 of the HID specification, version 1.1.  The first byte
>> - * of buffer is the report number to request, or 0x0 if the defice does not
>> + * of buffer is the report number to request, or 0x0 if the device does not
>>    * use numbered reports. The report_type parameter can be HID_FEATURE_REPORT
>>    * or HID_INPUT_REPORT.
>>    */
>> @@ -428,6 +428,28 @@ static long hidraw_ioctl(struct file *file, unsigned int
>> cmd,
>>                                          break;
>>                                  }
>>   
>> +                               if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSINPUT(0)))
>> {
>> +                                       int len = _IOC_SIZE(cmd);
>> +                                       ret = hidraw_send_report(file,
>> user_arg, len, HID_INPUT_REPORT);
>> +                                       break;
>> +                               }
>> +                               if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGINPUT(0)))
>> {
>> +                                       int len = _IOC_SIZE(cmd);
>> +                                       ret = hidraw_get_report(file,
>> user_arg, len, HID_INPUT_REPORT);
>> +                                       break;
>> +                               }
>> +
>> +                               if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSOUTPUT(0)))
>> {
>> +                                       int len = _IOC_SIZE(cmd);
>> +                                       ret = hidraw_send_report(file,
>> user_arg, len, HID_OUTPUT_REPORT);
>> +                                       break;
>> +                               }
>> +                               if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGOUTPUT(0)))
>> {
>> +                                       int len = _IOC_SIZE(cmd);
>> +                                       ret = hidraw_get_report(file,
>> user_arg, len, HID_OUTPUT_REPORT);
>> +                                       break;
>> +                               }
>> +
>>                                  /* Begin Read-only ioctls. */
>>                                  if (_IOC_DIR(cmd) != _IOC_READ) {
>>                                          ret = -EINVAL;
>> diff --git a/include/uapi/linux/hidraw.h b/include/uapi/linux/hidraw.h
>> index 4913539e5bcc..33ebad81720a 100644
>> --- a/include/uapi/linux/hidraw.h
>> +++ b/include/uapi/linux/hidraw.h
>> @@ -40,6 +40,12 @@ struct hidraw_devinfo {
>>   #define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
>>   #define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
>>   #define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
>> +/* The first byte of SINPUT and GINPUT is the report number */
>> +#define HIDIOCSINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x09, len)
>> +#define HIDIOCGINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0A, len)
>> +/* The first byte of SOUTPUT and GOUTPUT is the report number */
>> +#define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
>> +#define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)
>>   
>>   #define HIDRAW_FIRST_MINOR 0
>>   #define HIDRAW_MAX_DEVICES 64
>> diff --git a/samples/hidraw/hid-example.c b/samples/hidraw/hid-example.c
>> index 37a0ffcb4d63..0f73ace3c6c3 100644
>> --- a/samples/hidraw/hid-example.c
>> +++ b/samples/hidraw/hid-example.c
>> @@ -128,7 +128,7 @@ int main(int argc, char **argv)
>>                  perror("HIDIOCGFEATURE");
>>          } else {
>>                  printf("ioctl HIDIOCGFEATURE returned: %d\n", res);
>> -               printf("Report data (not containing the report number):\n\t");
> 
> This seems unrelated, you did not touch HIDIOCGFEATURE.
> 
>> +               printf("Report data:\n\t");
>>                  for (i = 0; i < res; i++)
>>                          printf("%hhx ", buf[i]);
>>                  puts("\n");
> 
